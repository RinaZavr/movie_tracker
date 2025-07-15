import 'package:flutter/material.dart';
import 'package:movie_tracker/src/config/styles/colors.dart';
import 'package:movie_tracker/src/config/styles/shadows.dart';

@immutable
class ThemeShadows extends ThemeExtension<ThemeShadows> {
  const ThemeShadows._({required this.primaryShadow});

  ThemeShadows.dark([Color color = AppColors.white30])
    : primaryShadow = AppShadows.darkThemeShadow.copyWith(color: color);

  ThemeShadows.light([Color color = AppColors.gray])
    : primaryShadow = AppShadows.lightThemeShadow.copyWith(color: color);

  final BoxShadow primaryShadow;

  @override
  ThemeExtension<ThemeShadows> lerp(
    ThemeExtension<ThemeShadows>? other,
    double t,
  ) {
    if (other is! ThemeShadows) {
      return this;
    }

    return ThemeShadows._(
      primaryShadow: BoxShadow.lerp(primaryShadow, other.primaryShadow, t)!,
    );
  }

  @override
  ThemeExtension<ThemeShadows> copyWith({BoxShadow? primaryShadow}) {
    return ThemeShadows._(primaryShadow: primaryShadow ?? this.primaryShadow);
  }

  static ThemeShadows of(BuildContext context) {
    return Theme.of(context).extension<ThemeShadows>()!;
  }
}
