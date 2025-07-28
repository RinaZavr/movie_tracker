import 'package:flutter/material.dart';
import 'package:movie_tracker/src/config/styles/colors.dart';
import 'package:movie_tracker/src/config/styles/typography.dart';

@immutable
class ThemeTypography extends ThemeExtension<ThemeTypography> {
  const ThemeTypography._({
    required this.label,
    required this.title,
    required this.base,
    required this.accentInfo,
    required this.info,
  });

  ThemeTypography.dark(
    BuildContext context, [
    Color color = AppColors.antiFlashWhite,
  ]) : label = AppTypography.montserratBold22(context).copyWith(color: color),
       title = AppTypography.montserratSemiBold20(
         context,
       ).copyWith(color: color),
       base = AppTypography.nunitoRegular18(context).copyWith(color: color),
       accentInfo = AppTypography.nunitoBold14(context).copyWith(color: color),
       info = AppTypography.nunitoRegular14(context).copyWith(color: color);

  ThemeTypography.light(
    BuildContext context, [
    Color color = AppColors.raisinBlack,
  ]) : label = AppTypography.montserratBold22(context).copyWith(color: color),
       title = AppTypography.montserratSemiBold20(
         context,
       ).copyWith(color: color),
       base = AppTypography.nunitoRegular18(context).copyWith(color: color),
       accentInfo = AppTypography.nunitoBold14(context).copyWith(color: color),
       info = AppTypography.nunitoRegular14(context).copyWith(color: color);

  final TextStyle label;
  final TextStyle title;
  final TextStyle base;
  final TextStyle accentInfo;
  final TextStyle info;

  @override
  ThemeExtension<ThemeTypography> lerp(
    ThemeExtension<ThemeTypography>? other,
    double t,
  ) {
    if (other is! ThemeTypography) {
      return this;
    }

    return ThemeTypography._(
      title: TextStyle.lerp(title, other.title, t)!,
      label: TextStyle.lerp(label, other.label, t)!,
      base: TextStyle.lerp(base, other.base, t)!,
      accentInfo: TextStyle.lerp(accentInfo, other.accentInfo, t)!,
      info: TextStyle.lerp(info, other.info, t)!,
    );
  }

  @override
  ThemeExtension<ThemeTypography> copyWith({
    TextStyle? title,
    TextStyle? label,
    TextStyle? base,
    TextStyle? accentInfo,
    TextStyle? info,
  }) {
    return ThemeTypography._(
      title: title ?? this.title,
      label: label ?? this.label,
      base: base ?? this.base,
      accentInfo: accentInfo ?? this.accentInfo,
      info: info ?? this.info,
    );
  }

  static ThemeTypography of(BuildContext context) {
    return Theme.of(context).extension<ThemeTypography>()!;
  }
}
