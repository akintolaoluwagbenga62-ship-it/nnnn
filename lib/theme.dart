import 'package:flutter/material.dart';

// ── COLORS ────────────────────────────────────────────────────────────────────
class BColor {
  // Dark palette (default)
  static const bg = Color(0xFF000000);
  static const bg1 = Color(0xFF16181C);
  static const bg2 = Color(0xFF1C1F23);
  static const border = Color(0xFF2F3336);
  static const muted = Color(0xFF71767B);
  static const text = Color(0xFFE7E9EA);
  static const textSub = Color(0xFFB0B8BF);

  // Mood colors
  static const hype = Color(0xFFFF4500);
  static const chill = Color(0xFF1DA1F2);
  static const deep = Color(0xFF8B5CF6);
  static const funny = Color(0xFFF59E0B);
  static const raw = Color(0xFF00BA7C);

  // Accent
  static const green = Color(0xFF00BA7C);
  static const danger = Color(0xFFF4212E);
  static const gold = Color(0xFFF59E0B);

  // Logo gradient
  static const logoA = Color(0xFF7C3AED);
  static const logoB = Color(0xFF06B6D4);

  static Color mood(String m) {
    switch (m) {
      case 'hype': return hype;
      case 'chill': return chill;
      case 'deep': return deep;
      case 'funny': return funny;
      default: return muted;
    }
  }
}

// ── THEME ─────────────────────────────────────────────────────────────────────
ThemeData bondlyTheme() => ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: BColor.bg,
  colorScheme: const ColorScheme.dark(
    surface: BColor.bg,
    onSurface: BColor.text,
    primary: BColor.text,
    secondary: BColor.deep,
    error: BColor.danger,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: BColor.bg,
    foregroundColor: BColor.text,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(color: BColor.text, fontSize: 16, fontWeight: FontWeight.w700),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: BColor.text, fontSize: 15),
    bodyMedium: TextStyle(color: BColor.textSub, fontSize: 14),
    bodySmall: TextStyle(color: BColor.muted, fontSize: 12),
    labelLarge: TextStyle(color: BColor.text, fontWeight: FontWeight.w700),
  ),
  dividerTheme: const DividerThemeData(color: BColor.border, thickness: 0.5),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: BColor.bg2,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: BColor.border)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: BColor.border)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: BColor.text)),
    hintStyle: const TextStyle(color: BColor.muted),
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: BColor.bg,
    selectedItemColor: BColor.text,
    unselectedItemColor: BColor.muted,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
    elevation: 0,
  ),
  cardColor: BColor.bg1,
  dialogBackgroundColor: BColor.bg1,
);
