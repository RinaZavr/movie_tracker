import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/common/widgets/movie_card.dart';
import 'package:movie_tracker/src/features/movies/root/cubit/movies_root_cubit.dart';
import 'package:movie_tracker/src/features/movies/root/view/widgets/movies_category_widget.dart';
import 'package:movie_tracker/src/features/movies/utils/utils.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final MoviesRootCubit _cubit = MoviesRootCubit();

  @override
  void initState() {
    _cubit.getMovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,

      child: Scaffold(
        body: BlocBuilder<MoviesRootCubit, MoviesRootState>(
          builder: (context, state) {
            if (state is MoviesRootLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is MoviesRootError) {
              return Center(
                child: Text(state.error, style: context.textExt.title),
              );
            }
            if (state is MoviesRootLoaded) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                      ),
                      items: state.topRated
                          .map(
                            (movie) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  MovieCard(
                                    movieId: movie.id,
                                    imageUrl:
                                        movie.backdropPath ?? movie.posterPath,
                                    vote: movie.voteAverage.toString(),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    aspectRatio: 16 / 9,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: context.colorExt.cardColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      movie.title,
                                      style: context.textExt.title,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: MoviesCategoryWidget(
                      category: MovieCategory.popular,
                      movies: state.popular,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: MoviesCategoryWidget(
                        category: MovieCategory.nowPlaying,
                        movies: state.nowPlaying,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 80),
                      child: MoviesCategoryWidget(
                        category: MovieCategory.upcoming,
                        movies: state.upcoming,
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
