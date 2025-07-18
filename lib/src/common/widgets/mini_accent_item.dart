import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';

class MiniAccentItem extends StatefulWidget {
  const MiniAccentItem({super.key, required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  State<MiniAccentItem> createState() => _MiniAccentItemState();
}

class _MiniAccentItemState extends State<MiniAccentItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kToolbarHeight / 1.3,
      height: kToolbarHeight / 1.8,
      child: IconButton(
        padding: EdgeInsets.zero,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            context.colorExt.accentColor,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          foregroundColor: WidgetStateProperty.all(
            context.colorExt.primaryColor,
          ),
        ),
        onPressed: widget.onTap,
        icon: widget.child,
      ),
    );
  }
}
