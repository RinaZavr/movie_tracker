import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/consts/icons_consts.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.maxHeight,
    required this.child,
  });

  final String title;
  final void Function() onTap;
  final double? maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: onTap,
            child: Row(
              spacing: 8,
              children: [
                Text(title, style: context.textExt.label),
                const Icon(AppIcons.forward),
              ],
            ),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.3,
          ),
          child: child,
        ),
      ],
    );
  }
}
