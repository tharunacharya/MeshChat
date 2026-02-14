import 'dart:ui'; // Add this for ImageFilter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/transport_provider.dart';
import '../../core/protocols/mesh_packet.dart';
import '../../core/encryption/security_service.dart';
import '../../core/encryption/handshake_service.dart';
import '../../data/db/message.dart';
import '../../data/local_db/local_database.dart';
import '../ai_assistant/ai_memory_service.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';
import 'package:isar/isar.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final String peerId;
  final String peerName;

  const ChatScreen({super.key, required this.peerId, required this.peerName});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  String? _suggestedReply;

  Stream<List<Message>>? _messagesStream;

  @override
  void initState() {
    super.initState();
    _initStream();
  }

  void _initStream() {
      _messagesStream = LocalDatabase.instance.isar.messages
        .filter()
        .senderIdEqualTo(widget.peerId)
        .or()
        .receiverIdEqualTo(widget.peerId)
        .sortByTimestamp()
        .watch(fireImmediately: true);
        
      _messagesStream!.listen((messages) {
         if (messages.isNotEmpty) {
            final lastMsg = messages.last;
            // If last message is from peer, suggest reply
            if (lastMsg.senderId == widget.peerId && !lastMsg.isSent) {
               _generateSmartReply(lastMsg.content);
            }
         }
      });
  }

  Future<void> _generateSmartReply(String incomingText) async {
     final suggestion = await AiMemoryService().suggestReply(incomingText);
     if (suggestion != null && mounted) {
        setState(() {
           _suggestedReply = suggestion;
        });
     }
  }

  void _sendMessage() async {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    try {
        final encryption = SecurityService();
        List<int> payloadBytes;
        bool encrypted = true;
        
        try {
           payloadBytes = await encryption.encrypt(widget.peerId, text);
        } catch (e) {
           print("Encryption failed, sending cleartext: $e");
           payloadBytes = utf8.encode(text);
           encrypted = false;
        }
        
        final packet = MeshPacket.create(
          type: PacketType.chat,
          senderId: "ME", // TODO: Real ID
          receiverId: widget.peerId,
          payload: {
            'text': base64Encode(payloadBytes),
            'encrypted': encrypted
          },
        );

        // Send via Routing Engine (Mesh or Cloud)
        final routing = ref.read(routingEngineProvider);
        await routing.sendPacket(packet);

        // Save locally immediately
        final msg = Message()
          ..messageId = packet.messageId
          ..senderId = "ME"
          ..receiverId = widget.peerId
          ..content = text
          ..timestamp = packet.timestamp
          ..isSent = true
          ..isEncrypted = encrypted;

        await LocalDatabase.instance.saveMessage(msg);
        
        // AI Analysis
        AiMemoryService().analyzeMessage(msg);

        _textController.clear();
    } catch (e) {
       print("Send failed: $e");
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Send failed: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.read(routingEngineProvider);
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: isLight ? Colors.white.withOpacity(0.4) : Colors.transparent,
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
        title: Column(
          children: [
            Text(widget.peerName, style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: isLight ? const Color(0xFF1E293B) : Colors.white)),
            Text("Encrypted Mesh Link", style: GoogleFonts.inter(fontSize: 10, color: isLight ? AppTheme.primary : AppTheme.accent)),
          ],
        ),
        iconTheme: IconThemeData(color: isLight ? const Color(0xFF1E293B) : Colors.white),
        actions: [
           IconButton(
             icon: Icon(Icons.security, color: isLight ? AppTheme.primary : AppTheme.accent),
             onPressed: () async {
                final transport = ref.read(wifiServiceProvider);
                await HandshakeService(transport).initiateHandshake(widget.peerId);
                if (context.mounted) {
                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Handshake Sent")));
                }
             },
           )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: isLight 
            ? const LinearGradient(
                colors: [Color(0xFFF0F4F8), Color(0xFFE2E8F0)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : const LinearGradient(
              colors: [Color(0xFF0F172A), Color(0xFF2E1065)], // Deep Space -> Nebula 
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<List<Message>>(
                  stream: _messagesStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) return Center(child: Text("Error: ${snapshot.error}"));
                    if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
                    
                    final messages = snapshot.data!;
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final msg = messages[index];
                        final isMe = msg.senderId == "ME";
                        return Align(
                          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(14),
                            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                            decoration: BoxDecoration(
                              color: isMe 
                                  ? AppTheme.primary.withOpacity(0.9) 
                                  : (isLight ? Colors.white.withOpacity(0.8) : Colors.white.withOpacity(0.1)),
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(20),
                                topRight: const Radius.circular(20),
                                bottomLeft: isMe ? const Radius.circular(20) : Radius.zero,
                                bottomRight: isMe ? Radius.zero : const Radius.circular(20),
                              ),
                              boxShadow: isLight ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 5,
                                  offset: const Offset(0, 2)
                                )
                              ] : [],
                              border: Border.all(
                                color: isMe 
                                  ? Colors.transparent 
                                  : (isLight ? Colors.white : Colors.white.withOpacity(0.05))
                              )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  msg.content,
                                  style: GoogleFonts.inter(
                                      color: isMe ? Colors.white : (isLight ? const Color(0xFF1E293B) : Colors.white), 
                                      fontSize: 15,
                                      height: 1.4
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if(isMe && msg.isDelivered) 
                                       Icon(Icons.done_all, size: 14, color: isLight ? Colors.white70 : AppTheme.accent),
                                    const SizedBox(width: 4),
                                    Text(
                                      "12:45 PM", // TODO: Real format
                                      style: GoogleFonts.inter(fontSize: 10, color: isMe ? Colors.white70 : (isLight ? Colors.black38 : Colors.white38)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              
              // Smart Reply Area
               if (_suggestedReply != null)
                 Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ActionChip(
                          backgroundColor: Colors.purple.withOpacity(0.2),
                          side: const BorderSide(color: Colors.purple),
                          avatar: const Icon(Icons.auto_awesome, size: 16, color: Colors.purpleAccent),
                          label: Text("Suggest: $_suggestedReply", style: const TextStyle(color: Colors.purpleAccent)),
                          onPressed: () {
                             _textController.text = _suggestedReply!;
                             setState(() => _suggestedReply = null);
                          },
                       ),
                    ),
                 ),

              // Input Area
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: isLight ? Colors.white.withOpacity(0.6) : Colors.black.withOpacity(0.4),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                      border: Border.all(color: isLight ? Colors.black.withOpacity(0.05) : Colors.white.withOpacity(0.05)),
                      boxShadow: isLight ? [
                        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -2))
                      ] : []
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: isLight ? Colors.white.withOpacity(0.6) : Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextField(
                              controller: _textController,
                              style: GoogleFonts.inter(color: isLight ? const Color(0xFF1E293B) : Colors.white),
                              decoration: InputDecoration(
                                hintText: "Type a secure message...",
                                hintStyle: TextStyle(color: isLight ? const Color(0xFF64748B) : Colors.white.withOpacity(0.3)),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: AppTheme.primaryGradient
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.send_rounded, color: Colors.white, size: 20),
                            onPressed: _sendMessage,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

