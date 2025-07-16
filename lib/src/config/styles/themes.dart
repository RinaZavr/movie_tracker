import 'package:flutter/material.dart';
import 'package:movie_tracker/src/config/styles/colors.dart';
import 'package:movie_tracker/src/config/styles/extensions/theme_colors.dart';
import 'package:movie_tracker/src/config/styles/extensions/theme_shadows.dart';
import 'package:movie_tracker/src/config/styles/extensions/theme_typography.dart';

abstract class AppThemes {
  const AppThemes._();

  static ThemeData dark(BuildContext context) => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    extensions: [
      const ThemeColors.dark(),
      ThemeTypography.dark(context),
      ThemeShadows.dark(),
    ],
    scaffoldBackgroundColor: AppColors.chineseBlack,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.chineseBlack),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.antiFlashWhite,
    ),
  );

  static ThemeData light(BuildContext context) => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    extensions: [
      const ThemeColors.light(),
      ThemeTypography.light(context),
      ThemeShadows.light(),
    ],
    scaffoldBackgroundColor: AppColors.ghostWhite,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.ghostWhite),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.raisinBlack,
    ),
  );
}
