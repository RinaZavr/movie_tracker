import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/common/widgets/image_widget.dart';
import 'package:movie_tracker/src/common/widgets/mini_accent_item.dart';
import 'package:movie_tracker/src/features/movies/utils/utils.dart';
import 'package:movies_api/api_client.dart';

class MovieDetailsBody extends StatefulWidget {
  const MovieDetailsBody({
    super.key,
    required this.movieDetails,
    this.trailer,
    this.review,
    required this.images,
    required this.recommendations,
  });

  final MovieDetails movieDetails;
  final MovieTrailer? trailer;
  final MovieReview? review;
  final MovieImages images;
  final MoviesList recommendations;

  @override
  State<MovieDetailsBody> createState() => _MovieDetailsBodyState();
}

class _MovieDetailsBodyState extends State<MovieDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ImageWidget(
            aspectRatio: 16 / 9,
            imageUrl: widget.movieDetails.backdropPath,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.movieDetails.genres
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
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Center(
              child: Text(
                widget.movieDetails.title,
                style: context.textExt.label,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
            child: Center(
              child: Text(
                formatDuration(widget.movieDetails.runtime),
                style: context.textExt.base,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
