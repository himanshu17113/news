import 'package:flutter/material.dart';
import 'package:material_color_utilities/palettes/core_palette.dart';
//import 'package:material_color_utilities/palettes/core_palette.dart';

class AppTheme {
  static ThemeData lightTheme(ColorScheme lightColorScheme) {
    CorePalette p = CorePalette.of(lightColorScheme!.primary.value);

    return ThemeData(
      colorScheme: lightColorScheme,
      useMaterial3: true,
      brightness: Brightness.light,
      //   colorSchemeSeed: Colors.green,
      fontFamily: 'Poppins',
      //  appBarTheme: const AppBarTheme(
      //     elevation: 0,
      //     titleSpacing: 0,
      //     color: primaryColor,
      //     titleTextStyle: TextStyle(fontSize: 18)),
      scaffoldBackgroundColor: Color(p.neutral.get(94)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(),
        //      elevation: 0,
        //  backgroundColor: primaryColor,
        //  foregroundColor: scheme.onPrimary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            side: BorderSide.none),
      )),
      textTheme: //Typography.englishLike2014
          TextTheme(
              displayLarge: const TextStyle(
               ),
              titleMedium: TextStyle(color: lightColorScheme.onBackground),
              titleSmall: const TextStyle(color: Colors.black45),
              //    headlineSmall: TextStyle(color: Colors.black45),
              displayMedium: const TextStyle(color: Colors.grey),
              bodyLarge: const TextStyle(color: Colors.grey)),
      tabBarTheme: const TabBarTheme(
        //     labelColor: white,
        labelPadding: EdgeInsets.zero,
        dividerHeight: .5,
        // labelStyle: TextStyle(color: white, height: .6),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.transparent,
        //  unselectedLabelColor: white40,
        //  unselectedLabelStyle: TextStyle(color: white40, height: .5)
      ),
      // colorSchemeSeed: primaryColor,
      // colorScheme: scheme,
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
      //     scaffoldBackgroundColor: scheme.surface,
      colorScheme: scheme,
      useMaterial3: true,
      // appBarTheme: const AppBarTheme(
      //     elevation: 0,
      //     titleSpacing: 0,
      //     color: primaryColor,
      //     titleTextStyle: TextStyle(fontSize: 18)),

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        //    elevation: 0,
        foregroundColor: scheme.onPrimary,
        textStyle: const TextStyle(color: Colors.black),
        backgroundColor: scheme.primary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            side: BorderSide.none),
      )),
      textTheme: //Typography.englishLike2014
          TextTheme(
              displayLarge: const TextStyle(
                color: Colors.grey,
              ),
              titleMedium: TextStyle(color: scheme.onPrimaryContainer),
              //  titleMedium: const TextStyle(color: white70, fontSize: 14),
              titleSmall: TextStyle(color: scheme.onPrimaryContainer),
              bodyMedium: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: scheme.onSecondaryContainer),
              //    headlineSmall: TextStyle(color: Colors.black45),
              displayMedium: const TextStyle(color: Colors.grey),
              bodyLarge: const TextStyle(color: Colors.grey)),
      tabBarTheme: TabBarTheme(
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        labelColor: scheme.onSecondaryContainer,
        labelPadding: EdgeInsets.zero,
        dividerHeight: .5,
        //  labelStyle: const TextStyle(color: white, height: .6),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.transparent,
        unselectedLabelColor: scheme.onSecondaryContainer.withOpacity(.4),
        // unselectedLabelStyle: const TextStyle(color: white40, height: .5)
      ),
    );
  }
}
