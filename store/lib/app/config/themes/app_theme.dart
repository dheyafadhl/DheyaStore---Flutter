import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // تعريف الألوان الأساسية من لوحة الألوان المحددة
  static const Color _darkBlue = Color(0xFF333446);
  static const Color _slateBlue = Color(0xFF7F8CAA);
  static const Color _powderBlue = Color(0xFFB8CFCE);
  static const Color _lightGray = Color(0xFFEAEFEF);

  // تعريف السمة الفاتحة للتطبيق
  static final ThemeData lightTheme = ThemeData(
    // استخدام نظام الألوان الجديد Material 3 لمظهر عصري
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: _lightGray,
    primaryColor: _darkBlue,

    // تعريف نظام الألوان الكامل للسمة
    colorScheme: const ColorScheme.light(
      primary: _darkBlue,
      secondary: _slateBlue,
      surface: _lightGray,
      background: _lightGray,
      error: Colors.redAccent,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: _darkBlue,
      onBackground: _darkBlue,
      onError: Colors.white,
    ),

    // تعريف أنماط النصوص باستخدام Google Fonts لمظهر احترافي
    textTheme: GoogleFonts.cairoTextTheme().copyWith(
      displayLarge: GoogleFonts.cairo(fontSize: 57, fontWeight: FontWeight.bold, color: _darkBlue),
      displayMedium: GoogleFonts.cairo(fontSize: 45, fontWeight: FontWeight.bold, color: _darkBlue),
      displaySmall: GoogleFonts.cairo(fontSize: 36, fontWeight: FontWeight.bold, color: _darkBlue, letterSpacing: 0.5),
      headlineMedium: GoogleFonts.cairo(fontSize: 28, fontWeight: FontWeight.w600, color: _darkBlue),
      titleLarge: GoogleFonts.cairo(fontSize: 22, fontWeight: FontWeight.w600, color: _darkBlue),
      bodyLarge: GoogleFonts.cairo(fontSize: 16, color: _slateBlue),
      bodyMedium: GoogleFonts.cairo(fontSize: 14, color: _slateBlue),
      labelLarge: GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
    ),

    // تصميم موحد للأزرار المرتفعة
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _darkBlue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.bold),
        elevation: 5,
        shadowColor: _darkBlue.withOpacity(0.4),
      ),
    ),

    // تصميم موحد لحقول إدخال النص
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _powderBlue, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _darkBlue, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
      ),
      labelStyle: GoogleFonts.cairo(color: _slateBlue),
      hintStyle: GoogleFonts.cairo(color: _powderBlue),
    ),
  );
}