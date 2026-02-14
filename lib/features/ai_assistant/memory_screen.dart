
import 'dart:ui'; // Add this for ImageFilter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/db/memory_fact.dart';
import 'ai_memory_service.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';

final memoriesProvider = FutureProvider<List<MemoryFact>>((ref) async {
  return await AiMemoryService().getMemories();
});

class MemoryScreen extends ConsumerWidget {
  const MemoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoriesAsync = ref.watch(memoriesProvider);
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
        title: Text("Neural Cloud 🧠", style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: isLight ? const Color(0xFF1E293B) : Colors.white)),
        centerTitle: true,
        iconTheme: IconThemeData(color: isLight ? const Color(0xFF1E293B) : Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: isLight ? AppTheme.primary : Colors.white),
            onPressed: () => ref.refresh(memoriesProvider),
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
              colors: [Color(0xFF0F172A), Color(0xFF312E81)], // Deep Space -> Indigo
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
        ),
        child: SafeArea(
          child: memoriesAsync.when(
            data: (memories) {
              if (memories.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.psychology_alt, size: 64, color: isLight ? Colors.black12 : Colors.white.withOpacity(0.2)),
                      const SizedBox(height: 16),
                      Text("No memories nodes formed.", style: GoogleFonts.inter(fontSize: 18, color: isLight ? const Color(0xFF64748B) : Colors.white54)),
                      Text("Chat to build the knowledge graph.", style: GoogleFonts.inter(color: isLight ? Colors.black38 : Colors.white38)),
                    ],
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: memories.length,
                itemBuilder: (context, index) {
                  final mem = memories[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: isLight ? Colors.white.withOpacity(0.6) : Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: isLight ? Colors.white.withOpacity(0.8) : Colors.white.withOpacity(0.1)),
                          boxShadow: isLight 
                            ? [BoxShadow(color: const Color(0xFF6C63FF).withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 4))] 
                            : [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      gradient: _getCategoryGradient(mem.category),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: _getCategoryColor(mem.category).withOpacity(0.4),
                                          blurRadius: 8,
                                        )
                                      ]
                                    ),
                                    child: Text(
                                      mem.category.toUpperCase(),
                                      style: GoogleFonts.outfit(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        letterSpacing: 1.2
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(Icons.auto_awesome, size: 12, color: isLight ? Colors.orange : AppTheme.accent.withOpacity(0.5)),
                                  const SizedBox(width: 4),
                                  Text(
                                    "${(mem.confidence * 100).toInt()}% Confidence",
                                    style: GoogleFonts.inter(color: isLight ? const Color(0xFF64748B) : Colors.white38, fontSize: 10),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                mem.fact,
                                style: GoogleFonts.inter(
                                    fontSize: 18, 
                                    fontWeight: FontWeight.w400, 
                                    color: isLight ? const Color(0xFF1E293B) : Colors.white
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                   color: isLight ? Colors.black.withOpacity(0.05) : Colors.black.withOpacity(0.2),
                                   borderRadius: BorderRadius.circular(8)
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.history, size: 12, color: isLight ? const Color(0xFF64748B) : Colors.white38),
                                    const SizedBox(width: 6),
                                    Text(
                                      "Source: Message ${mem.sourceMessageId.substring(0, 8)}...",
                                      style: GoogleFonts.inter(color: isLight ? const Color(0xFF64748B) : Colors.white38, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
      ),
    );
  }

  LinearGradient _getCategoryGradient(String category) {
    switch (category.toLowerCase()) {
      case 'preference': return const LinearGradient(colors: [Colors.purple, Colors.deepPurple]);
      case 'task': return const LinearGradient(colors: [Colors.orange, Colors.deepOrange]);
      case 'identity': return const LinearGradient(colors: [Colors.blue, Colors.lightBlue]);
      case 'plan': return const LinearGradient(colors: [Colors.green, Colors.teal]);
      case 'relationship': return const LinearGradient(colors: [Colors.pink, Colors.red]);
      default: return const LinearGradient(colors: [Colors.grey, Colors.blueGrey]);
    }
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'preference': return Colors.purple;
      case 'task': return Colors.orange;
      case 'identity': return Colors.blue;
      case 'plan': return Colors.green;
      case 'relationship': return Colors.pink;
      default: return Colors.grey;
    }
  }
}
