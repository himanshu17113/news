import 'package:flutter/material.dart';
import 'package:material_color_utilities/palettes/core_palette.dart';

class AppTheme {
  static ThemeData lightTheme(ColorScheme lightColorScheme) {
    CorePalette p = CorePalette.of(lightColorScheme.primary.value);

    return ThemeData( 
      colorScheme: lightColorScheme,
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: Color(p.neutral.get(94)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            side: BorderSide.none),
      )),
      textTheme: TextTheme(
          displayLarge: const TextStyle(),
          titleMedium: TextStyle(color: lightColorScheme.onBackground),
          titleSmall: const TextStyle(color: Colors.black45),
          displayMedium: const TextStyle(color: Colors.grey),
          bodyLarge: const TextStyle(color: Colors.grey)),
      tabBarTheme: const TabBarTheme(
        labelPadding: EdgeInsets.zero,
        dividerHeight: .5,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.transparent,
      ),
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              minimumSize: const Size(double.maxFinite, 50),
              maximumSize: const Size(double.maxFinite, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
    );
  }

  static ThemeData darkTheme(ColorScheme? darkColorScheme) {
    ColorScheme scheme = darkColorScheme ??
        ColorScheme.fromSeed(
            seedColor: const Color(0xFFF47C7C), brightness: Brightness.dark);
    return ThemeData(
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              minimumSize: const Size.fromWidth(double.maxFinite),
              maximumSize: const Size.fromWidth(double.maxFinite),
              shape: const RoundedRectangleBorder())),
      colorScheme: scheme,
      useMaterial3: true,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        foregroundColor: scheme.onPrimary,
        textStyle: const TextStyle(color: Colors.black),
        backgroundColor: scheme.primary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            side: BorderSide.none),
      )),
      textTheme: TextTheme(
          displayLarge: const TextStyle(
            color: Colors.grey,
          ),
          titleMedium: TextStyle(color: scheme.onPrimaryContainer),
          titleSmall: TextStyle(color: scheme.onPrimaryContainer),
          bodyMedium: TextStyle(
              fontWeight: FontWeight.w600, color: scheme.onSecondaryContainer),
          displayMedium: const TextStyle(color: Colors.grey),
          bodyLarge: const TextStyle(color: Colors.grey)),
      tabBarTheme: TabBarTheme(
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        labelColor: scheme.onSecondaryContainer,
        labelPadding: EdgeInsets.zero,
        dividerHeight: .5,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.transparent,
        unselectedLabelColor: scheme.onSecondaryContainer.withOpacity(.4),
      ),
    );
  }
}
