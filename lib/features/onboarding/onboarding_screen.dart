import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/preferences/user_preferences.dart';
import '../../core/theme/app_theme.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F172A), Color(0xFF1E1B4B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.hub, size: 80, color: AppTheme.accent),
                const SizedBox(height: 20),
                Text(
                  "MeshTalk Global",
                  style: GoogleFonts.outfit(
                      fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  "Secure Hybrid Messaging",
                  style: GoogleFonts.inter(color: Colors.white54),
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: _nameController,
                  style: GoogleFonts.inter(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Choose your Alias",
                    labelStyle: GoogleFonts.inter(color: Colors.white54),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.05),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _isLoading ? null : _completeSetup,
                    child: _isLoading 
                      ? const CircularProgressIndicator(color: Colors.white) 
                      : Text("Enter Mesh", style: GoogleFonts.outfit(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _completeSetup() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    setState(() => _isLoading = true);

    await UserPreferences().setUsername(name);
    // TODO: Send update to Cloud Bridge (via a CloudService method we will add)

    if (mounted) {
       context.go('/'); // Go to Home (Discovery)
    }
  }
}
