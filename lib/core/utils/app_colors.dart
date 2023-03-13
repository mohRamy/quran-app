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

  static Gradient gradient = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [
      branch,
      origin,
    ],
  );
}

class Themes {
  static final light = ThemeData(
    // brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.origin),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0.0,
    ),
    cardTheme: CardTheme(
      color: AppColors.subBackgroundLight,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.backgroundDark,
    ),
    listTileTheme: ListTileThemeData(
      textColor: AppColors.backgroundDark,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.origin,
      unselectedLabelColor: Colors.grey,
    ),
    textTheme: TextTheme( 
      titleLarge: TextStyle(
        color: AppColors.origin,
        fontSize: 27,
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
    // brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.origin),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0.0,
    ),
    cardTheme: CardTheme(
      color: AppColors.subBackgroundDark,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.backgroundLight,
    ),
    listTileTheme: ListTileThemeData(
      textColor: AppColors.backgroundLight,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.backgroundLight,
      unselectedLabelColor: Colors.grey,
    ),
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        color: Colors.white,
        fontSize: 27,
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
