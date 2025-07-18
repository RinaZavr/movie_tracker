import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_tracker/src/common/consts/icons_consts.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/common/widgets/mini_accent_item.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: context.textExt.title),
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Align(
          child: MiniAccentItem(
            onTap: () => context.pop(),
            child: const Icon(AppIcons.back),
          ),
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
