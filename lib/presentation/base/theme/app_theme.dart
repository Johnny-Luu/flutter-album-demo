import 'package:flutter/material.dart';

class _LightModeColor {
  static const Color appbarBackground = Colors.green;
  static const Color secondary = Color.fromARGB(255, 232, 255, 255);
  static const Color normalText = Colors.black87;
  static const Color smallText = Colors.black45;
}

class _DarkModeColor {
  static const Color appbarBackground = Color.fromARGB(255, 43, 43, 43);
  static const Color secondary = Colors.green;
  static const Color normalText = Colors.white;
  static const Color smallText = Colors.white54;
}

class AppTheme {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primaryColor: Colors.green,
      appBarTheme: ThemeData().appBarTheme.copyWith(
            titleTextStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            backgroundColor: isDarkTheme
                ? _DarkModeColor.appbarBackground
                : _LightModeColor.appbarBackground,
          ),
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: isDarkTheme
                ? _LightModeColor.secondary
                : _DarkModeColor.secondary,
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      textTheme: TextTheme(
        displayMedium: TextStyle(
          color: isDarkTheme
              ? _DarkModeColor.normalText
              : _LightModeColor.normalText,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: isDarkTheme
              ? _DarkModeColor.smallText
              : _LightModeColor.smallText,
          fontSize: 14,
        ),
      ),
    );
  }
}
