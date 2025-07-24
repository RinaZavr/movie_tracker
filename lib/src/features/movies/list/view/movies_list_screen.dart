import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tracker/src/common/widgets/custom_app_bar.dart';
import 'package:movie_tracker/src/common/widgets/movie_card.dart';
import 'package:movie_tracker/src/features/movies/list/cubit/movies_list_cubit.dart';
import 'package:movie_tracker/src/features/movies/utils/utils.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({super.key, required this.category});

  final MovieCategory category;

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  late MoviesListCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = MoviesListCubit(category: widget.category)..getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: CustomAppBar(title: widget.category.localized(context)),
        body: BlocBuilder<MoviesListCubit, MoviesListState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.error.isNotEmpty) {
              return Center(child: Text(state.error));
            }

            if (state.movies.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: NotificationListener(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollEndNotification &&
                        scrollNotification.metrics.extentAfter == 0) {
                      _cubit.getMovies();
                      return true;
                    }
                    return false;
                  },
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.7,
                        ),
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      return MovieCard(
                        imageUrl: state.movies[index].posterPath,
                        vote: '0.0',
                      );
                    },
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
