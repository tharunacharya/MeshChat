import 'dart:ui'; // Add this for ImageFilter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';
import '../../data/local_db/local_database.dart';
import '../../data/db/contact.dart';
import '../../data/db/message.dart';
import '../../core/preferences/user_preferences.dart';
import '../../core/cloud/cloud_service.dart';

class ChatListScreen extends ConsumerStatefulWidget {
  const ChatListScreen({super.key});

  @override
  ConsumerState<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends ConsumerState<ChatListScreen> {
  List<Contact> _contacts = [];
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _loadChats();
  }

  Future<void> _loadChats() async {
    final contacts = await LocalDatabase.instance.getAllContacts();
    setState(() {
      _contacts = contacts;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;

    final filteredContacts = _contacts.where((c) {
       return c.name.toLowerCase().contains(_searchQuery) || 
              c.peerId.toLowerCase().contains(_searchQuery);
    }).toList();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("MeshTalk Global", style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: isLight ? const Color(0xFF1E293B) : Colors.white)),
        backgroundColor: isLight ? Colors.white.withOpacity(0.4) : Colors.transparent,
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Reduced from 10
            child: Container(color: Colors.transparent),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.radar, color: isLight ? AppTheme.primary : Colors.white),
            onPressed: () => context.push('/'),
          ),
          IconButton(
            icon: Icon(Icons.person, color: isLight ? const Color(0xFF1E293B) : Colors.white),
            onPressed: () => context.push('/profile'),
          ),
          IconButton(
            icon: Icon(Icons.psychology, color: isLight ? AppTheme.primary : Colors.white),
            onPressed: () => context.push('/memory'),
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
                colors: [Color(0xFF0F172A), Color(0xFF1E1B4B)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Text(
                   "Welcome, ${UserPreferences().username}",
                   style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.bold, color: isLight ? const Color(0xFF1E293B) : Colors.white),
                 ),
               ),
                              // Search Bar
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: isLight ? Colors.white.withOpacity(0.8) : Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isLight ? Colors.white.withOpacity(0.8) : Colors.white.withOpacity(0.1),
                    ),
                    boxShadow: isLight ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4)
                      )
                    ] : [],
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (val) {
                      setState(() {
                         _searchQuery = val.toLowerCase();
                      });
                    },
                    style: GoogleFonts.inter(color: isLight ? const Color(0xFF1E293B) : Colors.white),
                    decoration: InputDecoration(
                      hintText: "Search chats...",
                      hintStyle: GoogleFonts.inter(color: isLight ? const Color(0xFF64748B) : Colors.white38),
                      prefixIcon: Icon(Icons.search, color: isLight ? AppTheme.primary : Colors.white54),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      filled: false,
                    ),
                  ),
                ),
              ),

               if (filteredContacts.isEmpty && !_isLoading)
                 Expanded(
                   child: Center(
                     child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.chat_bubble_outline, size: 64, color: isLight ? Colors.black12 : Colors.white.withOpacity(0.2)),
                          const SizedBox(height: 16),
                          Text("No chats found", style: GoogleFonts.inter(color: isLight ? Colors.black38 : Colors.white54)),
                          if (_contacts.isEmpty)
                            TextButton(
                              onPressed: () => context.push('/'), 
                              child: const Text("Start Scanning")
                            )
                        ],
                     ),
                   )
                 )
               else
                 Expanded(
                   child: ListView.builder(
                     itemCount: filteredContacts.length,
                     itemBuilder: (context, index) {
                       final contact = filteredContacts[index];
                       return Container(
                         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                         decoration: BoxDecoration(
                            color: isLight ? Colors.white.withOpacity(0.8) : Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: isLight ? Colors.white.withOpacity(0.8) : Colors.white.withOpacity(0.05)),
                            boxShadow: isLight ? [
                               BoxShadow(
                                  color: const Color(0xFF6C63FF).withOpacity(0.08),
                                  blurRadius: 10,
                                  offset: const Offset(0, 2)
                               )
                            ] : [],
                         ),
                         child: ListTile(
                           leading: CircleAvatar(
                             backgroundColor: isLight ? AppTheme.primary.withOpacity(0.2) : AppTheme.primary,
                             child: Text(contact.name[0].toUpperCase(), 
                                style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.bold,
                                  color: isLight ? AppTheme.primary : Colors.white
                                )
                             ),
                           ),
                           title: Text(contact.name, style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: isLight ? const Color(0xFF1E293B) : Colors.white)),
                           subtitle: Text("Tap to chat", style: GoogleFonts.inter(fontSize: 12, color: isLight ? const Color(0xFF64748B) : Colors.white54)),
                           trailing: Icon(Icons.chevron_right, color: isLight ? Colors.black26 : Colors.white24),
                           onTap: () {
                             context.push('/chat/${contact.peerId}?name=${contact.name}');
                           },
                         ),
                       );
                     },
                   )
                 )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: isLight ? AppTheme.primary : AppTheme.accent,
        icon: Icon(Icons.add, color: isLight ? Colors.white : Colors.black),
        label: Text("New Chat", style: GoogleFonts.outfit(color: isLight ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
        elevation: isLight ? 8 : 0,
        onPressed: () {
          _showNewChatDialog(context, isLight);
        },
      ),
    );
  }

  void _showNewChatDialog(BuildContext context, bool isLight) {
    final inputController = TextEditingController();
    bool resolving = false;
    
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: isLight ? Colors.white : const Color(0xFF1E293B),
            title: Text("Start New Chat", style: GoogleFonts.outfit(color: isLight ? const Color(0xFF1E293B) : Colors.white)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Enter Peer ID or Alias (e.g. @username)",
                  style: GoogleFonts.inter(color: isLight ? const Color(0xFF64748B) : Colors.white70),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: inputController,
                  style: GoogleFonts.inter(color: isLight ? const Color(0xFF1E293B) : Colors.white),
                  decoration: InputDecoration(
                    labelText: "ID or Alias",
                    labelStyle: GoogleFonts.inter(color: isLight ? const Color(0xFF94A3B8) : Colors.white54),
                    filled: true,
                    fillColor: isLight ? const Color(0xFFF1F5F9) : Colors.black.withOpacity(0.2),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                if (resolving)
                   Padding(
                     padding: const EdgeInsets.only(top: 10),
                     child: LinearProgressIndicator(color: AppTheme.primary),
                   )
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel", style: TextStyle(color: isLight ? Colors.grey : Colors.white70)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary),
                onPressed: resolving ? null : () async {
                  final input = inputController.text.trim();
                  if (input.isEmpty) return;

                  if (input.startsWith('@')) {
                    // Resolve Alias
                    setState(() => resolving = true);
                    final alias = input.substring(1);
                    final result = await CloudService().resolveAlias(alias);
                    setState(() => resolving = false);

                    if (result != null) {
                      if (context.mounted) {
                        Navigator.pop(context);
                        context.push('/chat/${result['peerId']}?name=$alias');
                      }
                    } else {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Alias not found")));
                      }
                    }
                  } else {
                    // Direct ID
                    Navigator.pop(context);
                    context.push('/chat/$input?name=Unknown ID'); 
                  }
                },
                child: const Text("Start Chat", style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        }
      ),
    );
  }
}
