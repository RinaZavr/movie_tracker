import 'package:flutter/material.dart';
import 'package:movie_tracker/src/config/styles/colors.dart';
import 'package:movie_tracker/src/config/styles/typography.dart';

@immutable
class ThemeTypography extends ThemeExtension<ThemeTypography> {
  const ThemeTypography._({required this.title});

  ThemeTypography.light(BuildContext context, [Color color = AppColors.black])
    : title = AppTypography.fontBold20(context).copyWith(color: color);

  ThemeTypography.dark(BuildContext context, [Color color = AppColors.white])
    : title = AppTypography.fontBold20(context).copyWith(color: color);

  final TextStyle title;

  @override
  ThemeExtension<ThemeTypography> lerp(
    ThemeExtension<ThemeTypography>? other,
    double t,
  ) {
    if (other is! ThemeTypography) {
      return this;
    }

    return ThemeTypography._(title: TextStyle.lerp(title, other.title, t)!);
  }

  static ThemeTypography of(BuildContext context) {
    return Theme.of(context).extension<ThemeTypography>()!;
  }

  @override
  ThemeExtension<ThemeTypography> copyWith({TextStyle? title}) {
    return ThemeTypography._(title: title ?? this.title);
  }
}
