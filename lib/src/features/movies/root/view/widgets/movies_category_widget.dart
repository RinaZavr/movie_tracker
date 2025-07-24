import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/consts/icons_consts.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/common/widgets/movie_card.dart';
import 'package:movie_tracker/src/config/router/routes.dart';
import 'package:movie_tracker/src/features/movies/utils/utils.dart';
import 'package:movies_api/api_client.dart';

class MoviesCategoryWidget extends StatelessWidget {
  const MoviesCategoryWidget({
    super.key,
    required this.category,
    required this.movies,
  });

  final MovieCategory category;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () {
              MoviesListRoute(category: category).push(context);
            },
            child: Row(
              spacing: 8,
              children: [
                Text(category.localized(context), style: context.textExt.label),
                const Icon(AppIcons.forward),
              ],
            ),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.3,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MovieCard(
                imageUrl: movies[index].posterPath,
                vote: movies[index].voteAverage.toString(),
                margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
              );
            },
            itemCount: movies.length,
          ),
        ),
      ],
    );
  }
}
