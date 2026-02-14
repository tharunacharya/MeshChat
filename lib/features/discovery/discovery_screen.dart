
import 'dart:ui'; // Add this for ImageFilter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/transport_provider.dart';
import '../../core/transport/transport_interface.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';

class DiscoveryScreen extends ConsumerStatefulWidget {
  const DiscoveryScreen({super.key});

  @override
  ConsumerState<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends ConsumerState<DiscoveryScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final peersAsync = ref.watch(discoveredPeersProvider);
    final wifiService = ref.read(wifiServiceProvider);
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
        title: Text("MeshTalk Global", style: GoogleFonts.outfit(color: isLight ? const Color(0xFF1E293B) : Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
             icon: Icon(Icons.psychology, color: isLight ? AppTheme.primary : AppTheme.accent),
             onPressed: () => context.push('/memory'),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: isLight 
            ? const LinearGradient(
                colors: [Color(0xFFF0F4F8), Color(0xFFE2E8F0)], // Liquid Ice
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
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isLight ? Colors.white.withOpacity(0.6) : Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isLight ? Colors.white.withOpacity(0.8) : Colors.white.withOpacity(0.1),
                          width: 1.5
                        ),
                        boxShadow: isLight ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 20,
                            spreadRadius: 0,
                            offset: const Offset(0, 8)
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
                          hintText: "Search peers...",
                          hintStyle: GoogleFonts.inter(color: isLight ? const Color(0xFF64748B) : Colors.white38),
                          prefixIcon: Icon(Icons.search, color: isLight ? AppTheme.primary : Colors.white54),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          filled: false,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Scanning Indicator
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isLight ? AppTheme.primary.withOpacity(0.1) : Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: isLight ? AppTheme.primary.withOpacity(0.2) : Colors.white.withOpacity(0.1)),
                ),
                child: Row(
                  children: [
                     SizedBox(
                      width: 20, 
                      height: 20, 
                      child: CircularProgressIndicator(strokeWidth: 2, color: isLight ? AppTheme.primary : const Color(0xFF00D4FF))
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Scanning Sector...", 
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.bold, 
                              color: isLight ? const Color(0xFF1E293B) : Colors.white
                            )
                          ),
                          Text("Searching via WiFi Direct", 
                            style: GoogleFonts.inter(
                              fontSize: 12, 
                              color: isLight ? const Color(0xFF64748B) : Colors.white54
                            )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // Peer List
              Expanded(
                child: peersAsync.when(
                  data: (peers) {
                    final filteredPeers = peers.where((p) {
                       return p.deviceName.toLowerCase().contains(_searchQuery) || 
                              p.id.toLowerCase().contains(_searchQuery);
                    }).toList();

                    if (filteredPeers.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.signal_wifi_off, size: 48, color: isLight ? Colors.black12 : Colors.white.withOpacity(0.2)),
                            const SizedBox(height: 16),
                            Text("No peers found", style: GoogleFonts.inter(color: isLight ? Colors.black38 : Colors.white54)),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      itemCount: filteredPeers.length,
                      itemBuilder: (context, index) {
                        final peer = filteredPeers[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                color: isLight ? Colors.white.withOpacity(0.6) : Colors.white.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: isLight ? Colors.white.withOpacity(0.8) : Colors.white.withOpacity(0.05)),
                                boxShadow: isLight ? [
                                   BoxShadow(
                                      color: const Color(0xFF6C63FF).withOpacity(0.08),
                                      blurRadius: 15,
                                      offset: const Offset(0, 5)
                                   )
                                ] : [],
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(12),
                                leading: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    gradient: isLight ? AppTheme.primaryGradient : null,
                                    color: isLight ? null : const Color(0xFF6C63FF).withOpacity(0.2),
                                    shape: BoxShape.circle,
                                    boxShadow: isLight ? [
                                      BoxShadow(
                                        color: AppTheme.primary.withOpacity(0.3),
                                        blurRadius: 8,
                                        offset: const Offset(0, 4)
                                      )
                                    ] : []
                                  ),
                                  child: const Icon(Icons.person, color: Colors.white, size: 20),
                                ),
                                title: Text(peer.deviceName, 
                                  style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.bold,
                                    color: isLight ? const Color(0xFF1E293B) : Colors.white
                                  )
                                ),
                                subtitle: Text("@${peer.id.substring(0, 8)}", 
                                  style: GoogleFonts.sourceCodePro(
                                    fontSize: 12,
                                    color: isLight ? const Color(0xFF64748B) : Colors.white70
                                  )
                                ),
                                trailing: Container(
                                   width: 40, height: 40,
                                   decoration: BoxDecoration(
                                     color: isLight ? AppTheme.primary.withOpacity(0.1) : Colors.white.withOpacity(0.1),
                                     shape: BoxShape.circle
                                   ),
                                   child: IconButton(
                                      icon: Icon(Icons.arrow_forward_rounded, size: 18, color: isLight ? AppTheme.primary : Colors.white),
                                      onPressed: () async {
                                         await wifiService.connect(peer);
                                         if (context.mounted) {
                                           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Initializing Handshake...")));
                                           await Future.delayed(const Duration(seconds: 1));
                                           await wifiService.startSocket();
                                           if (context.mounted) {
                                              GoRouter.of(context).push('/chat/${peer.id}?name=${peer.deviceName}');
                                           }
                                         }
                                      },
                                   ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Center(child: Text("Error: $err")),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: isLight ? AppTheme.primary : const Color(0xFF6C63FF),
        elevation: isLight ? 10 : 0,
        label: Text("Radar Scan", style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        icon: const Icon(Icons.radar),
        onPressed: () => wifiService.startDiscovery(),
      ),
    );
  }
}
