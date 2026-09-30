import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryDark = Color(0xFF070B14);
  static const Color surfaceDark = Color(0xFF0F172A);
  static const Color cardDark = Color(0xFF131D31);
  static const Color borderDark = Color(0xFF1E293B);
  static const Color accentBlue = Color(0xFF3B82F6);
  static const Color accentCyan = Color(0xFF06B6D4);
  static const Color accentIndigo = Color(0xFF6366F1);
  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFF94A3B8);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: primaryDark,
      colorScheme: const ColorScheme.dark(
        primary: accentBlue,
        secondary: accentCyan,
        surface: surfaceDark,
        onSurface: textPrimaryDark,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.inter(
          color: textPrimaryDark,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.5,
        ),
        displayMedium: GoogleFonts.inter(
          color: textPrimaryDark,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.0,
        ),
        headlineLarge: GoogleFonts.inter(
          color: textPrimaryDark,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: GoogleFonts.inter(
          color: textPrimaryDark,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: GoogleFonts.inter(
          color: textPrimaryDark,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: GoogleFonts.inter(
          color: textPrimaryDark,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.inter(
          color: textSecondaryDark,
          height: 1.5,
        ),
      ),
      cardTheme: CardTheme(
        color: cardDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: borderDark, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2563EB),
          foregroundColor: Colors.white,
          elevation: 8,
          shadowColor: const Color(0xFF3B82F6).withOpacity(0.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: textPrimaryDark,
          backgroundColor: cardDark,
          side: const BorderSide(color: Color(0xFF3B82F6), width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
