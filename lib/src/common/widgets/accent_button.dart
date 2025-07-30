import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';

class AccentButton extends StatelessWidget {
  const AccentButton({
    super.key,
    required this.title,
    required this.onTap,
    this.style,
    this.margin,
  });

  final String title;
  final VoidCallback onTap;
  final TextStyle? style;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.colorExt.accentColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [context.shadowExt.primaryShadow],
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: (style ?? context.textExt.title).copyWith(
            color: context.colorExt.primaryColor,
          ),
        ),
      ),
    );
  }
}
