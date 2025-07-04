import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/notifiers/theme_notifier.dart';
import 'package:movie_tracker/src/config/styles/extensions/theme_colors.dart';
import 'package:movie_tracker/src/config/styles/extensions/theme_typography.dart';
import 'package:provider/provider.dart';

extension ContextExtensions on BuildContext {
  ThemeColors get colorExt => Theme.of(this).extension<ThemeColors>()!;

  ThemeTypography get textExt => Theme.of(this).extension<ThemeTypography>()!;

  ThemeNotifier get theme => read<ThemeNotifier>();

}
