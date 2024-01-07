//  import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:material_color_utilities/material_color_utilities.dart';

// const Color seedColor = Colors.red;

// static Color getSurface(bool darkMode) {
//   CorePalette p = CorePalette.of(seedColor.value);
//   return Color(p.neutral.get(darkMode ? 6 : 98));
// }

// static Color getSurfaceDim(bool darkMode) {
//   CorePalette p = CorePalette.of(seedColor.value);
//   return Color(p.neutral.get(darkMode ? 6 : 87));
// }

// static Color getSurfaceBright(bool darkMode) {
//   CorePalette p = CorePalette.of(seedColor.value);
//   return Color(p.neutral.get(darkMode ? 24 : 98));
// }

// static Color getSurfaceContainerLowest(bool darkMode) {
//   CorePalette p = CorePalette.of(seedColor.value);
//   return Color(p.neutral.get(darkMode ? 4 : 100));
// }

// static Color getSurfaceContainerLow(bool darkMode) {
//   CorePalette p = CorePalette.of(seedColor.value);
//   return Color(p.neutral.get(darkMode ? 10 : 96));
// }

// static Color getSurfaceContainer(bool darkMode) {
//   CorePalette p = CorePalette.of(seedColor.value);
//   return Color(p.neutral.get(darkMode ? 12 : 94));
// }

// static Color getSurfaceContainerHigh(bool darkMode) {
//   CorePalette p = CorePalette.of(seedColor.value);
//   return Color(p.neutral.get(darkMode ? 17 : 92));
// }

// static Color getSurfaceContainerHighest(bool darkMode) {
//   CorePalette p = CorePalette.of(seedColor.value);
//   return Color(p.neutral.get(darkMode ? 22 : 90));
// }
// extension MaterialColors on BuildContext {
//   static final Map<bool, Map<DynamicColor, Color>> _colorCache = {};

//   bool get isDarkTheme {
//     Brightness brightness = Theme.of(this).brightness;

//     if (brightness == Brightness.dark) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   DynamicScheme _createDynamicScheme() {
//     final TonalPalette primaryPalette =
//         TonalPalette.fromHct(Hct.fromInt(AppColors.primaryColor.value));
//     final TonalPalette secondaryPalette = TonalPalette.fromHct(Hct.fromInt(
//         AppColors.secondaryColor?.value ??
//             Theme.of(this).colorScheme.secondary.value));
//     final TonalPalette tertiaryPalette = TonalPalette.fromHct(Hct.fromInt(
//         AppColors.tertiaryColor?.value ??
//             Theme.of(this).colorScheme.tertiary.value));
//     final TonalPalette neutralPalette = TonalPalette.fromHct(
//         Hct.fromInt(Theme.of(this).colorScheme.surface.value));
//     final TonalPalette neutralVariantPalette = TonalPalette.fromHct(
//         Hct.fromInt(Theme.of(this).colorScheme.surfaceVariant.value));

//     return DynamicScheme(
//         sourceColorArgb: AppColors.primaryColor.value,
//         variant: Variant.vibrant,
//         isDark: isDarkTheme,
//         primaryPalette: primaryPalette,
//         secondaryPalette: secondaryPalette,
//         tertiaryPalette: tertiaryPalette,
//         neutralPalette: neutralPalette,
//         neutralVariantPalette: neutralVariantPalette);
//   }

//   Color _getColor(DynamicColor colorType) {
//     bool isDark =
//         isDarkTheme;
//     if (_colorCache[isDark]?.containsKey(colorType) ?? false) {
//       return _colorCache[isDark]![colorType]!;
//     }

//     final dynamicScheme = _createDynamicScheme();
//     final color = Color(colorType.getArgb(dynamicScheme));
//     _colorCache[isDark] ??= {};
//     _colorCache[isDark]![colorType] = color;

//     return color;
//   }

//   Color get primary {
//     return _getColor(MaterialDynamicColors.primary);
//   }

//   Color get onPrimary {
//     return _getColor(MaterialDynamicColors.onPrimary);
//   }

//   Color get primaryContainer {
//     return _getColor(MaterialDynamicColors.primaryContainer);
//   }

//   Color get onPrimaryContainer {
//     return _getColor(MaterialDynamicColors.onPrimaryContainer);
//   }

//   Color get primaryFixed {
//     return _getColor(MaterialDynamicColors.primaryFixed);
//   }

//   Color get primaryFixedDim {
//     return _getColor(MaterialDynamicColors.primaryFixedDim);
//   }

//   Color get onPrimaryFixed {
//     return _getColor(MaterialDynamicColors.onPrimaryFixed);
//   }

//   Color get onPrimaryFixedVariant {
//     return _getColor(MaterialDynamicColors.onPrimaryFixedVariant);
//   }

//   // Secondary
//   Color get secondary {
//     return _getColor(MaterialDynamicColors.secondary);
//   }

//   Color get onSecondary {
//     return _getColor(MaterialDynamicColors.onSecondary);
//   }

//   Color get secondaryContainer {
//     return _getColor(MaterialDynamicColors.secondaryContainer);
//   }

//   Color get onSecondaryContainer {
//     return _getColor(MaterialDynamicColors.onSecondaryContainer);
//   }

//   Color get secondaryFixed {
//     return _getColor(MaterialDynamicColors.secondaryFixed);
//   }

//   Color get secondaryFixedDim {
//     return _getColor(MaterialDynamicColors.secondaryFixedDim);
//   }

//   Color get onSecondaryFixed {
//     return _getColor(MaterialDynamicColors.onSecondaryFixed);
//   }

//   Color get onSecondaryFixedVariant {
//     return _getColor(MaterialDynamicColors.onSecondaryFixedVariant);
//   }

//   // Tertiary
//   Color get tertiary {
//     return _getColor(MaterialDynamicColors.tertiary);
//   }

//   Color get onTertiary {
//     return _getColor(MaterialDynamicColors.onTertiary);
//   }

//   Color get tertiaryContainer {
//     return _getColor(MaterialDynamicColors.tertiaryContainer);
//   }

//   Color get onTertiaryContainer {
//     return _getColor(MaterialDynamicColors.onTertiaryContainer);
//   }

//   Color get tertiaryFixed {
//     return _getColor(MaterialDynamicColors.tertiaryFixed);
//   }

//   Color get tertiaryFixedDim {
//     return _getColor(MaterialDynamicColors.tertiaryFixedDim);
//   }

//   Color get onTertiaryFixed {
//     return _getColor(MaterialDynamicColors.onTertiaryFixed);
//   }

//   Color get onTertiaryFixedVariant {
//     return _getColor(MaterialDynamicColors.onTertiaryFixedVariant);
//   }

//   // Error
//   Color get error {
//     return _getColor(MaterialDynamicColors.error);
//   }

//   Color get onError {
//     return _getColor(MaterialDynamicColors.onError);
//   }

//   Color get errorContainer {
//     return _getColor(MaterialDynamicColors.errorContainer);
//   }

//   Color get onErrorContainer {
//     return _getColor(MaterialDynamicColors.onErrorContainer);
//   }

//   // Surface
//   Color get surfaceDim {
//     return _getColor(MaterialDynamicColors.surfaceDim);
//   }

//   Color get surface {
//     return _getColor(MaterialDynamicColors.surface);
//   }

//   Color get surfaceBright {
//     return _getColor(MaterialDynamicColors.surfaceBright);
//   }

//   Color get surfaceContainerLowest {
//     return _getColor(MaterialDynamicColors.surfaceContainerLowest);
//   }

//   Color get surfaceContainerLow {
//     return _getColor(MaterialDynamicColors.surfaceContainerLow);
//   }

//   Color get surfaceContainer {
//     return _getColor(MaterialDynamicColors.surfaceContainer);
//   }

//   Color get surfaceContainerHigh {
//     return _getColor(MaterialDynamicColors.surfaceContainerHigh);
//   }

//   Color get surfaceContainerHighest {
//     return _getColor(MaterialDynamicColors.surfaceContainerHighest);
//   }

//   Color get onSurface {
//     return _getColor(MaterialDynamicColors.onSurface);
//   }

//   Color get onSurfaceVariant {
//     return _getColor(MaterialDynamicColors.onSurfaceVariant);
//   }

//   Color get outline {
//     return _getColor(MaterialDynamicColors.outline);
//   }

//   Color get outlineVariant {
//     return _getColor(MaterialDynamicColors.outlineVariant);
//   }

//   Color get inverseSurface {
//     return _getColor(MaterialDynamicColors.inverseSurface);
//   }

//   Color get inverseOnSurface {
//     return _getColor(MaterialDynamicColors.inverseOnSurface);
//   }

//   Color get inversePrimary {
//     return _getColor(MaterialDynamicColors.inversePrimary);
//   }

//   Color get scrim {
//     return _getColor(MaterialDynamicColors.scrim);
//   }

//   Color get shadow {
//     return _getColor(MaterialDynamicColors.shadow);
//   }
// }