import 'package:flutter/material.dart';
import 'package:movie_tracker/src/config/styles/colors.dart';

@immutable
class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors._({
    required this.primaryColor,
    required this.cardColor,
    required this.accentColor,
    required this.secondaryColor,
    required this.hintColor,
    required this.lineColor,
    required this.errorColor,
    required this.successColor,
    required this.infoColor,
    required this.shadowColor,
  });

  const ThemeColors.dark()
    : primaryColor = AppColors.chineseBlack,
      cardColor = AppColors.eerieBlack,
      accentColor = AppColors.blazeOrange,
      secondaryColor = AppColors.antiFlashWhite,
      hintColor = AppColors.philippineSilver,
      lineColor = AppColors.charlestonGreen,
      errorColor = AppColors.cgRed,
      successColor = AppColors.apple,
      infoColor = AppColors.pictonBlue,
      shadowColor = AppColors.white30;

  const ThemeColors.light()
    : primaryColor = AppColors.ghostWhite,
      cardColor = AppColors.white80,
      accentColor = AppColors.blazeOrange,
      secondaryColor = AppColors.raisinBlack,
      hintColor = AppColors.graniteGray,
      lineColor = AppColors.chineseWhite,
      errorColor = AppColors.persianRed,
      successColor = AppColors.mayGreen,
      infoColor = AppColors.brightNavyBlue,
      shadowColor = AppColors.gray;

  final Color primaryColor;
  final Color cardColor;
  final Color accentColor;
  final Color secondaryColor;
  final Color hintColor;
  final Color lineColor;
  final Color errorColor;
  final Color successColor;
  final Color infoColor;
  final Color shadowColor;

  @override
  ThemeExtension<ThemeColors> copyWith({Color? primaryColor}) {
    return ThemeColors._(
      primaryColor: primaryColor ?? this.primaryColor,
      cardColor: cardColor,
      accentColor: accentColor,
      secondaryColor: secondaryColor,
      hintColor: hintColor,
      lineColor: lineColor,
      errorColor: errorColor,
      successColor: successColor,
      infoColor: infoColor,
      shadowColor: shadowColor,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors._(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      hintColor: Color.lerp(hintColor, other.hintColor, t)!,
      lineColor: Color.lerp(lineColor, other.lineColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      successColor: Color.lerp(successColor, other.successColor, t)!,
      infoColor: Color.lerp(infoColor, other.infoColor, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
    );
  }

  static ThemeColors of(BuildContext context) =>
      Theme.of(context).extension<ThemeColors>()!;
}
