import 'package:flutter/material.dart';

abstract class AppTypography {
  const AppTypography._();

  static const String fontFamilyTitles = 'Montserrat';
  static const String fontFamilyBase = 'Nunito';

  // Функция для расчета адаптивного размера шрифта
  static double getAdaptiveFontSize(BuildContext context, double baseSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    return baseSize * (screenWidth / 411);
  }

  static TextStyle montserratBold20(BuildContext context) => TextStyle(
    fontFamily: fontFamilyTitles,
    fontWeight: FontWeight.w700,
    fontSize: getAdaptiveFontSize(context, 22),
  );

  static TextStyle montserratSemiBold18(BuildContext context) => TextStyle(
    fontFamily: fontFamilyTitles,
    fontWeight: FontWeight.w600,
    fontSize: getAdaptiveFontSize(context, 20),
  );

  static TextStyle nunitoRegular16(BuildContext context) => TextStyle(
    fontFamily: fontFamilyBase,
    fontWeight: FontWeight.w400,
    fontSize: getAdaptiveFontSize(context, 18),
  );

  static TextStyle nunitoBold12(BuildContext context) => TextStyle(
    fontFamily: fontFamilyBase,
    fontWeight: FontWeight.w700,
    fontSize: getAdaptiveFontSize(context, 14),
  );

  static TextStyle nunitoLight12(BuildContext context) => TextStyle(
    fontFamily: fontFamilyBase,
    fontWeight: FontWeight.w300,
    fontSize: getAdaptiveFontSize(context, 14),
  );
}
