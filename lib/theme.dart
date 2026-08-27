// lib/config/app_theme.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color surfaceLightColorA0 = Color(0xfffcfdff);
  static const Color surfaceLightColorA10 = Color(0xffedeef0);
  static const Color surfaceLightColorA40 = Color(0xffc3c4c5);
  static const Color surfaceDarkColorA0 = Color(0xff121212);
  static const Color surfaceDarkColorA10 = Color(0xff282828);
  static const Color surfaceDarkColorA30 = Color(0xff3f3f3f);
  static const Color surfaceDarkColorA40 = Color.fromARGB(255, 43, 40, 40);
  static const Color accentColor = Color(0xFF437aa0);
  static const Color errorColor = Color(0xFFB00020);
  static const Color textLightColor = Colors.black87;
  static const Color textDarkColor = Colors.white;

  // Tema terang (Light Theme)
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.light,
    primaryColor: surfaceDarkColorA40,
    primaryColorLight: surfaceDarkColorA30,
    hintColor: accentColor, // Warna aksen untuk input, dll.
    scaffoldBackgroundColor: surfaceLightColorA0,
    colorScheme: ColorScheme.light(
      primary: surfaceDarkColorA40,
      primaryContainer: surfaceDarkColorA30,
      secondary: accentColor,
      error: errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onError: Colors.white,
      onSurface: textLightColor,
    ),

    // textTheme: TextTheme(
    //   displayLarge: GoogleFonts.inter(
    //     fontSize: 57,
    //     fontWeight: FontWeight.normal,
    //     color: textLightColor,
    //   ),
    //   displayMedium: GoogleFonts.inter(
    //     fontSize: 45,
    //     fontWeight: FontWeight.normal,
    //     color: textLightColor,
    //   ),
    //   displaySmall: GoogleFonts.inter(
    //     fontSize: 36,
    //     fontWeight: FontWeight.normal,
    //     color: textLightColor,
    //   ),
    //   headlineLarge: GoogleFonts.inter(
    //     fontSize: 40,
    //     fontWeight: FontWeight.bold,
    //     color: textLightColor,
    //   ),
    //   headlineMedium: GoogleFonts.inter(
    //     fontSize: 28,
    //     fontWeight: FontWeight.bold,
    //     color: textLightColor,
    //   ),
    //   headlineSmall: GoogleFonts.inter(
    //     fontSize: 20,
    //     fontWeight: FontWeight.bold,
    //     color: textLightColor,
    //   ),
    //   titleLarge: GoogleFonts.inter(
    //     fontSize: 28,
    //     fontWeight: FontWeight.bold,
    //     color: textLightColor,
    //   ),
    //   titleMedium: GoogleFonts.inter(
    //     fontSize: 20,
    //     fontWeight: FontWeight.normal,
    //     color: textLightColor,
    //   ),
    //   titleSmall: GoogleFonts.inter(
    //     fontSize: 18,
    //     fontWeight: FontWeight.w600,
    //     color: textLightColor,
    //   ),
    //   bodyLarge: GoogleFonts.inter(fontSize: 18, color: textLightColor),
    //   bodyMedium: GoogleFonts.inter(fontSize: 16, color: textLightColor),
    //   bodySmall: GoogleFonts.inter(fontSize: 12, color: textLightColor),
    //   labelLarge: GoogleFonts.inter(
    //     fontSize: 18,
    //     fontWeight: FontWeight.bold,
    //     color: Colors.black,
    //   ), // Untuk tombol
    //   labelMedium: GoogleFonts.inter(
    //     fontSize: 16,
    //     fontWeight: FontWeight.bold,
    //     color: textLightColor,
    //   ),
    //   labelSmall: GoogleFonts.inter(
    //     fontSize: 12,
    //     fontWeight: FontWeight.bold,
    //     color: textLightColor,
    //   ),
    // ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty<Color>.fromMap({
          WidgetState.pressed: Colors.transparent,
          WidgetState.hovered: surfaceLightColorA0,
          WidgetState.any: Colors.transparent,
        }),
        foregroundColor: WidgetStateProperty<Color>.fromMap({
          WidgetState.pressed: surfaceLightColorA0,
          WidgetState.hovered: surfaceDarkColorA40,
          WidgetState.any: surfaceLightColorA0,
        }),
        overlayColor: WidgetStateProperty<Color>.fromMap({
          WidgetState.pressed: Colors.transparent,
          WidgetState.hovered: surfaceDarkColorA40.withValues(alpha: 0.1),
          WidgetState.any: Colors.transparent,
        }),
        fixedSize: WidgetStateProperty.all<Size>(const Size(26, 26)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty<Color>.fromMap({
          WidgetState.pressed: Colors.transparent,
          WidgetState.hovered: surfaceLightColorA0,
          WidgetState.any: Colors.transparent,
        }),
        foregroundColor: WidgetStateProperty<Color>.fromMap({
          WidgetState.pressed: surfaceLightColorA0,
          WidgetState.hovered: surfaceDarkColorA40,
          WidgetState.any: surfaceLightColorA0,
        }),
        side: WidgetStateProperty<BorderSide>.fromMap({
          WidgetState.pressed: const BorderSide(
            color: surfaceDarkColorA40,
            width: 2,
          ),
          WidgetState.hovered: const BorderSide(
            color: surfaceLightColorA0,
            width: 2,
          ),
          WidgetState.any: const BorderSide(
            color: surfaceDarkColorA40,
            width: 2,
          ),
        }),
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(surfaceDarkColorA40),
        foregroundColor: WidgetStateProperty.all<Color>(surfaceLightColorA0),
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        shadowColor: WidgetStateProperty<Color>.fromMap({
          WidgetState.pressed:
              Colors.transparent, // Menghilangkan shadow saat ditekan
          WidgetState.hovered: Colors.white,
          WidgetState.any: Colors.transparent,
        }),
        overlayColor: WidgetStateProperty<Color>.fromMap({
          WidgetState.pressed: Colors.transparent,
          WidgetState.hovered: Colors.white.withValues(alpha: 0.3),
          WidgetState.any: Colors.transparent,
        }),
        elevation: WidgetStateProperty.fromMap({
          WidgetState.pressed: 0.0, // Menghilangkan elevasi saat ditekan
          WidgetState.hovered: 8.0, // Elevasi saat hover
          WidgetState.any: 0.0, // Elevasi default
        }),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceLightColorA0,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 16.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none, // Tanpa border default
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: surfaceDarkColorA40, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: surfaceDarkColorA40, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: errorColor, width: 2.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: errorColor, width: 2.0),
      ),
      labelStyle: const TextStyle(color: textLightColor),
      hintStyle: GoogleFonts.inter(
        color: textLightColor.withValues(alpha: 0.4),
      ),
    ),
  );
}
