import 'package:flutter/material.dart';

class KlarandoTheme {
  static const Color brandPink = Color(0xFFF10F74);
  static const Color brandRose = Color(0xFFFF2F63);
  static const Color brandOrange = Color(0xFFFF8A00);
  static const Color brandGold = Color(0xFFFFCC1F);
  static const Color brandInk = Color(0xFF2D1122);
  static const Color shellBackground = Color(0xFFFFF4EE);
  static const Color cardBorder = Color(0xFFFFC4A6);
  static const Color cardSurface = Color(0xFFFFFFFF);
  static const Color mutedText = Color(0xFF8F2F2A);

  static ThemeData materialTheme({String? fontFamily}) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: brandOrange,
      brightness: Brightness.light,
    ).copyWith(
      primary: brandOrange,
      secondary: brandPink,
      tertiary: brandGold,
      surface: cardSurface,
      onSurface: brandInk,
      error: const Color(0xFFC0392B),
    );

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: shellBackground,
      fontFamily: fontFamily,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: brandInk,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: cardSurface,
        elevation: 0,
        shadowColor: const Color(0x26E2462B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: cardBorder),
        ),
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: Color(0x33FF8A00),
        labelTextStyle: WidgetStatePropertyAll(
          TextStyle(
            color: brandInk,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        labelStyle: const TextStyle(color: mutedText),
        hintStyle: const TextStyle(color: Color(0xB38F2F2A)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: cardBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: cardBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: brandOrange, width: 1.6),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          elevation: 0,
          backgroundColor: brandOrange,
          foregroundColor: Colors.white,
          disabledBackgroundColor: const Color(0xFFEDC8B8),
          disabledForegroundColor: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: brandOrange,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: brandInk,
          side: const BorderSide(color: cardBorder),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        side: const BorderSide(color: cardBorder),
        backgroundColor: const Color(0xFFFFF2EA),
        selectedColor: const Color(0x26FF8A00),
        labelStyle: const TextStyle(color: brandInk, fontWeight: FontWeight.w600),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: brandInk,
        contentTextStyle: const TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        behavior: SnackBarBehavior.floating,
      ),
      dividerColor: const Color(0xFFFFD5C0),
    );

    return base;
  }
}
