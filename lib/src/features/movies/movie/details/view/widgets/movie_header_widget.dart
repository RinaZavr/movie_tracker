import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/common/widgets/image_widget.dart';
import 'package:movie_tracker/src/common/widgets/mini_accent_item.dart';
import 'package:movie_tracker/src/features/movies/utils/utils.dart';

class MovieHeaderWidget extends StatelessWidget {
  const MovieHeaderWidget({
    super.key,
    required this.backdropPath,
    required this.genres,
  });

  final String? backdropPath;
  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    return ImageWidget(
      aspectRatio: 16 / 9,
      imageUrl: backdropPath,

      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: genres
              .map(
                (genre) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 8,
                  ),
                  child: MiniAccentItem(
                    child: Text(
                      capitalize(genre),
                      style: context.textExt.info.copyWith(
                        color: context.colorExt.primaryColor,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
