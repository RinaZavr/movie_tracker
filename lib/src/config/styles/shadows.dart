import 'package:flutter/material.dart';

abstract class AppShadows {
  const AppShadows._();

  static const lightThemeShadow = BoxShadow(
    blurRadius: 4,
    offset: Offset(0, 4),
  );

  static const darkThemeShadow = BoxShadow(blurRadius: 4, offset: Offset(0, 2));
}
