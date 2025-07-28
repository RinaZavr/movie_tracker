import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_tracker/src/common/consts/icons_consts.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/common/widgets/mini_accent_item.dart';

class MovieDetailsAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MovieDetailsAppBar({super.key, required this.id, required this.vote});

  final int id;
  final String vote;

  @override
  State<MovieDetailsAppBar> createState() => _MovieDetailsAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MovieDetailsAppBarState extends State<MovieDetailsAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Align(
          child: MiniAccentItem(
            child: const Icon(AppIcons.back),
            onTap: () => context.pop(),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: MiniAccentItem(
            child: Text(
              widget.vote,
              style: context.textExt.accentInfo.copyWith(
                color: context.colorExt.primaryColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: MiniAccentItem(
            child: const Icon(AppIcons.favorite),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
