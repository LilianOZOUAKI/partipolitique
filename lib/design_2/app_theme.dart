import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  // Couleurs principales
  primaryColor: const Color(0xFF002B5B),        // Bleu marine
  secondaryHeaderColor: const Color(0xFF228B22), // Vert forêt
  scaffoldBackgroundColor: const Color(0xFFF4F9FF), // Blanc ciel

  // Palette de couleurs personnalisée
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(0xFF002B5B),
    secondary: const Color(0xFF228B22),
    surface: Colors.white,
    // background: const Color(0xFFF4F9FF),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    // onBackground: const Color(0xFF4F4F4F), // Gris éléphant pour textes secondaires
    onSurface: const Color(0xFF4F4F4F),
  ),

  // Police claire et officielle
  fontFamily: 'Roboto',  // Ou 'Open Sans', selon ce que tu préfères

  // Text styles généraux
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFF002B5B),
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Color(0xFF002B5B),
    ),
    headlineSmall: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Color(0xFF228B22),
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Color(0xFF4F4F4F),
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Color(0xFF4F4F4F),
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),

  // Boutons stylisés
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: const Color(0xFF228B22),  // Vert forêt
      disabledForegroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      elevation: 4,
      shadowColor: const Color(0x8000221b), // Légère ombre verte
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: const Color(0xFF228B22),
      side: const BorderSide(color: Color(0xFF228B22), width: 2),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ),

  // Input fields styling
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFF4F4F4F)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFF4F4F4F)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFF228B22), width: 2),
    ),
    labelStyle: const TextStyle(
      color: Color(0xFF4F4F4F),
      fontWeight: FontWeight.w600,
    ),
  ),

  // AppBar theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF002B5B),
    foregroundColor: Colors.white,
    elevation: 4,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),

  // Card theme
  // cardTheme: CardTheme(
  //   color: Colors.white,
  //   elevation: 4,
  //   shadowColor: Colors.black26,
  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //   margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  // ),

  // Animations (animations douces)
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.fuchsia: FadeUpwardsPageTransitionsBuilder(),
    },
  ),
);
