import 'package:flutter/material.dart';

import 'hex_color.dart';

class AppColors {
  static Color origin = HexColor("FF943DF4");
  static Color branch = HexColor("FFD2BEE8");
  static Color backgroundLight = HexColor("FFFAF8FC");
  static Color subBackgroundLight = HexColor("FFF8F5FC");
  static Color backgroundDark = HexColor("FF1E0771");
  static Color subBackgroundDark = HexColor("FF2B0C8B");
  static Color button = HexColor("FFE6704A");
  static Color subString = HexColor("FFB9A2D8");
}

class Themes {
  static final light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.origin),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0.0,
    ),
    cardTheme: CardTheme(
      color: AppColors.subBackgroundLight,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.origin,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: AppColors.branch,
        fontSize: 20,
      ),
      titleSmall: const TextStyle(
        color: Colors.black,
      ),
    ),
    useMaterial3: true,
  );

  static final dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.origin),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0.0,
    ),
    cardTheme: CardTheme(
      color: AppColors.subBackgroundDark,
    ),
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: AppColors.branch,
        fontSize: 20,
      ),
      titleSmall: const TextStyle(
        color: Colors.white,
      ),
    ),
    useMaterial3: true,
  );
}
