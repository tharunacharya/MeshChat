import 'dart:ui'; // Add this for ImageFilter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';
import '../../core/preferences/user_preferences.dart';
import '../../core/cloud/cloud_service.dart';
// import '../../core/providers/transport_provider.dart'; // For Mesh Status if needed

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _aliasController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  bool _isEditing = false;
  String _peerId = "";

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  void _loadProfile() {
    setState(() {
      _peerId = UserPreferences().peerId;
      _nameController.text = UserPreferences().username ?? "Unknown";
      _aliasController.text = UserPreferences().alias ?? "";
      _aboutController.text = "Using MeshTalk Global"; // TODO: Add 'About' to UserPreferences
    });
  }

  Future<void> _saveProfile() async {
    await UserPreferences().setUsername(_nameController.text);
    
    // Save Alias
    final newAlias = _aliasController.text.trim();
    if (newAlias.isNotEmpty && newAlias != UserPreferences().alias) {
      final success = await CloudService().setAlias(newAlias);
      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Profile & Alias Saved!")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Failed to set Alias (maybe taken?)")));
        }
      }
    } else {
       if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Profile Saved!")));
    }

    setState(() {
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isCloudConnected = CloudService().isConnected;
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Profile", style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: isLight ? const Color(0xFF1E293B) : Colors.white)),
        backgroundColor: isLight ? Colors.white.withOpacity(0.4) : Colors.transparent,
        iconTheme: IconThemeData(color: isLight ? const Color(0xFF1E293B) : Colors.white),
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Reduced from 10
            child: Container(color: Colors.transparent),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit, color: isLight ? AppTheme.primary : AppTheme.accent),
            onPressed: () {
              if (_isEditing) {
                _saveProfile();
              } else {
                setState(() => _isEditing = true);
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
                colors: [Color(0xFF0F172A), Color(0xFF1E1B4B)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Avatar
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.primary,
                          border: Border.all(color: isLight ? Colors.white : AppTheme.accent, width: 2),
                          boxShadow: [
                            BoxShadow(color: AppTheme.primary.withOpacity(0.4), blurRadius: 20)
                          ]
                        ),
                        child: Center(
                          child: Text(
                            _nameController.text.isNotEmpty ? _nameController.text[0].toUpperCase() : "?",
                            style: GoogleFonts.outfit(fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      if (_isEditing)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppTheme.accent,
                              shape: BoxShape.circle,
                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5)]
                            ),
                            child: const Icon(Icons.camera_alt, color: Colors.black, size: 20),
                          ),
                        )
                    ],
                  ),
                ),
                const SizedBox(height: 32),
 
                // Fields
                _buildTextField("Display Name", _nameController, _isEditing, isLight),
                const SizedBox(height: 16),
                _buildTextField("Alias (@username)", _aliasController, _isEditing, isLight),
                const SizedBox(height: 16),
                _buildTextField("About", _aboutController, _isEditing, isLight),
                
                const SizedBox(height: 32),
                
                // My ID Section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isLight ? Colors.white.withOpacity(0.8) : Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: isLight ? Colors.white.withOpacity(0.8) : Colors.white.withOpacity(0.1)),
                    boxShadow: isLight ? [
                       BoxShadow(color: const Color(0xFF6C63FF).withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 4))
                    ] : []
                  ),
                  child: Column(
                    children: [
                      Text("MY PEER ID", style: GoogleFonts.inter(fontSize: 12, color: isLight ? const Color(0xFF64748B) : Colors.white54, letterSpacing: 1.5)),
                      const SizedBox(height: 8),
                      SelectableText(
                        _peerId,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sourceCodePro(color: isLight ? AppTheme.primary : AppTheme.accent, fontSize: 14),
                      ),
                      const SizedBox(height: 12),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.copy, size: 16),
                        label: const Text("Copy ID"),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: isLight ? AppTheme.primary : AppTheme.accent,
                          side: BorderSide(color: isLight ? AppTheme.primary.withOpacity(0.5) : Colors.white54)
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: _peerId));
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("ID Copied!")));
                        },
                      )
                    ],
                  ),
                ),
 
                const SizedBox(height: 32),
                
                // Network Status
                _buildStatusTile(
                  icon: Icons.cloud, 
                  title: "Cloud Bridge", 
                  status: isCloudConnected ? "Connected" : "Disconnected",
                  color: isCloudConnected ? Colors.green : Colors.red,
                  isLight: isLight
                ),
                _buildStatusTile(
                   icon: Icons.wifi_tethering,
                   title: "Mesh Network",
                   status: "Active (Scanning)", // Placeholder
                   color: Colors.green,
                   isLight: isLight
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
 
  Widget _buildTextField(String label, TextEditingController controller, bool enabled, bool isLight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.inter(color: isLight ? const Color(0xFF64748B) : Colors.white54, fontSize: 13)),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () {
             if (!enabled && !_isEditing) {
               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Tap the Edit icon to change profile details.")));
             }
          },
          child: TextField(
            controller: controller,
            enabled: enabled,
            style: GoogleFonts.outfit(color: isLight ? const Color(0xFF1E293B) : Colors.white, fontSize: 16),
            decoration: InputDecoration(
              filled: true,
              fillColor: isLight ? Colors.white.withOpacity(0.9) : Colors.black.withOpacity(0.4), // Increased opacity for performance (less blending?) 
              // Actually opacity doesn't affect performance much, but blur does.
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), 
                borderSide: isLight ? BorderSide(color: Colors.white.withOpacity(0.5)) : BorderSide.none
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), 
                borderSide: isLight ? BorderSide(color: Colors.white.withOpacity(0.5)) : BorderSide.none
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        )
      ],
    );
  }
 
  Widget _buildStatusTile({required IconData icon, required String title, required String status, required Color color, required bool isLight}) {
    // Removed BackdropFilter here for performance
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLight ? Colors.white.withOpacity(0.8) : Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: isLight ? Border.all(color: Colors.white.withOpacity(0.8)) : null,
        boxShadow: isLight ? [BoxShadow(color: const Color(0xFF6C63FF).withOpacity(0.05), blurRadius: 5)] : null
      ),
      child: Row(
        children: [
          Icon(icon, color: isLight ? const Color(0xFF64748B) : Colors.white70),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.outfit(color: isLight ? const Color(0xFF1E293B) : Colors.white)),
                Text(status, style: GoogleFonts.inter(color: color, fontSize: 12)),
              ],
            ),
          ),
          Container(
            width: 8, height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [BoxShadow(color: color.withOpacity(0.5), blurRadius: 5)]),
          )
        ],
      ),
    );
  }
}
