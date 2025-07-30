import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/common/widgets/accent_button.dart';
import 'package:movie_tracker/src/features/movies/movie/details/view/widgets/movie_gallery_widget.dart';
import 'package:movie_tracker/src/features/movies/movie/details/view/widgets/movie_header_widget.dart';
import 'package:movie_tracker/src/features/movies/movie/details/view/widgets/movie_info_widget.dart';
import 'package:movie_tracker/src/features/movies/movie/details/view/widgets/movie_overview_widget.dart';
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
          child: MovieHeaderWidget(
            backdropPath:
                widget.movieDetails.backdropPath ??
                widget.images.backdrops.firstOrNull,
            genres: widget.movieDetails.genres,
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
        SliverToBoxAdapter(
          child: AccentButton(
            margin: EdgeInsets.all(16),
            title: context.l10n.movieTrailer,
            onTap: () {},
          ),
        ),
        if (widget.movieDetails.overview.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MovieOverviewWidget(
                overview: widget.movieDetails.overview,
              ),
            ),
          ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: MovieInfoWidget(details: widget.movieDetails),
          ),
        ),
        SliverToBoxAdapter(
          child: MovieGalleryWidget(images: widget.images.backdrops),
        ),
      ],
    );
  }
}
