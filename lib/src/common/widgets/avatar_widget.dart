import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/consts/icons_consts.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key, required this.path, this.size});

  final String? path;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? MediaQuery.of(context).size.width * 0.12,
      height: size ?? MediaQuery.of(context).size.width * 0.12,
      decoration: BoxDecoration(
        color: context.colorExt.cardColor,
        shape: BoxShape.circle,
        image: path != null
            ? DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  path ??
                      'https://image.tmdb.org/t/p/original/xy44UvpbTgzs9kWmp4C3fEaCl5h.png',
                ),
              )
            : null,
      ),
      child: path == null ? const Icon(AppIcons.profile) : null,
    );
  }
}
