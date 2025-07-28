import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/common/widgets/image_widget.dart';
import 'package:movie_tracker/src/common/widgets/mini_accent_item.dart';
import 'package:movie_tracker/src/config/router/routes.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movieId,
    required this.imageUrl,
    required this.vote,
    this.padding,
    this.margin,
    this.aspectRatio,
  });

  final int movieId;
  final String imageUrl;
  final String vote;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? aspectRatio;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MovieDetailsRoute(id: movieId).push(context);
      },
      child: ImageWidget(
        aspectRatio: aspectRatio,
        imageUrl: imageUrl,
        padding: padding,
        margin: margin,
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: MiniAccentItem(
              child: Text(
                vote,
                style: context.textExt.accentInfo.copyWith(
                  color: context.colorExt.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
