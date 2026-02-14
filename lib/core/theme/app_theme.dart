import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primary = Color(0xFF6C63FF); // Cyber Violet
  static const Color accent = Color(0xFF00D4FF); // Neon Blue
  static const Color background = Color(0xFF0F172A); // Deep Space
  static const Color surface = Color(0xFF1E293B); // Slate
  static const Color text = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6C63FF), Color(0xFF00D4FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glassGradient = LinearGradient(
    colors: [Colors.white10, Colors.white10], // white05 doesn't exist
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF0F4F8), // Ice White
      primaryColor: primary,
      colorScheme: const ColorScheme.light(
        primary: primary,
        secondary: accent,
        surface: Colors.white,
        background: Color(0xFFF0F4F8),
      ),
      
      // Typography
      textTheme: TextTheme(
        displayLarge: GoogleFonts.outfit(
          fontSize: 32, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)
        ),
        displayMedium: GoogleFonts.outfit(
          fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16, color: const Color(0xFF334155)
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14, color: const Color(0xFF475569)
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 16, fontWeight: FontWeight.w600, color: const Color(0xFF1E293B)
        ),
      ),

      // App Bar
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white.withOpacity(0.7),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.outfit(
          fontSize: 20, fontWeight: FontWeight.w600, color: const Color(0xFF1E293B)
        ),
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
      ),

      // Card Theme (Commented out to avoid build errors, use BoxDecoration)
      /*cardTheme: CardThemeData(
        color: Colors.white.withOpacity(0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
      ),*/
      
      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintStyle: GoogleFonts.inter(color: const Color(0xFF94A3B8)),
        contentPadding: const EdgeInsets.all(16),
      ),
      
      useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: accent,
        surface: surface,
        background: background,
      ),
      
      // Typography
      textTheme: TextTheme(
        displayLarge: GoogleFonts.outfit(
          fontSize: 32, fontWeight: FontWeight.bold, color: text
        ),
        displayMedium: GoogleFonts.outfit(
          fontSize: 24, fontWeight: FontWeight.bold, color: text
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16, color: text
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14, color: textSecondary
        ),
      ),

      // App Bar
      appBarTheme: AppBarTheme(
        backgroundColor: background.withOpacity(0.8),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.outfit(
          fontSize: 20, fontWeight: FontWeight.w600, color: text
        ),
        iconTheme: const IconThemeData(color: text),
      ),

      // Card Theme
      /*cardTheme: CardThemeData(
        color: surface.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
      ),*/
      
      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintStyle: GoogleFonts.inter(color: textSecondary),
        contentPadding: const EdgeInsets.all(16),
      ),
      
      useMaterial3: true,
    );
  }
}
