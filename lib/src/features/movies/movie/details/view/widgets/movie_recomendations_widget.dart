import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/common/widgets/category_widget.dart';
import 'package:movie_tracker/src/common/widgets/movie_card.dart';
import 'package:movies_api/api_client.dart';

class MovieRecommendationsWidget extends StatelessWidget {
  const MovieRecommendationsWidget({super.key, required this.recomendations});

  final List<Movie> recomendations;

  @override
  Widget build(BuildContext context) {
    return CategoryWidget(
      title: context.l10n.movieRecommendations,
      onTap: () {},
      error: 'Рекомендаций нет',
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return MovieCard(
            movieId: recomendations[index].id,
            imageUrl: recomendations[index].posterPath,
            vote: recomendations[index].voteAverage.toString(),
            margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
          );
        },
        itemCount: recomendations.length,
      ),
    );
  }
}
