import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/consts/icons_consts.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.maxHeight,
    this.child,
    this.error,
  }) : assert(
        child != null || error != null,
        'If "child" is null, "error" must not be null',
      );

  final String title;
  final void Function() onTap;
  final double? maxHeight;
  final Widget? child;
  final String? error;

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
        if (child != null)
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.3,
            ),
            child: child,
          )
        else
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              error ?? 'Элементов не найдено',
              style: context.textExt.accentInfo.copyWith(
                color: context.colorExt.errorColor,
              ),
            ),
          ),
      ],
    );
  }
}
