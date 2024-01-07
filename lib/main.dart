import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'splash/splash.dart';
import 'theme/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemStatusBarContrastEnforced: false));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final ThemeMode themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) => DynamicColorBuilder(
      builder: (ColorScheme? lightColorScheme, ColorScheme? darkColorScheme) =>
          MaterialApp(
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme(lightColorScheme ??
                ColorScheme.fromSeed(seedColor: Colors.purple)),
            darkTheme: AppTheme.darkTheme(darkColorScheme),
            home: const SplashScreen(),
          ));
}
