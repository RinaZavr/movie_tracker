import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/common/widgets/custom_app_bar.dart';
import 'package:movie_tracker/src/features/movies/movie/details/cubit/movie_details_cubit.dart';
import 'package:movie_tracker/src/features/movies/movie/details/view/widgets/movie_details_app_bar.dart';
import 'package:movie_tracker/src/features/movies/movie/details/view/widgets/movie_details_body.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key, required this.id});

  final int id;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late MovieDetailsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = MovieDetailsCubit(id: widget.id)
      ..getMovie(currentLocale: context.localization.locale);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: _buildAppBar(state),
            body: _buildBody(state),
          );
        },
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar(MovieDetailsState state) {
    if (state is MovieDetailsLoaded) {
      return MovieDetailsAppBar(
        id: state.movieDetails.id,
        vote: state.movieDetails.voteAverage.toString(),
      );
    }
    return CustomAppBar();
  }

  Widget _buildBody(MovieDetailsState state) {
    if (state is MovieDetailsLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (state is MovieDetailsError) {
      return Center(child: Text(state.error, style: context.textExt.title));
    } else if (state is MovieDetailsLoaded) {
      return MovieDetailsBody(
        movieDetails: state.movieDetails,
        trailer: state.trailer,
        review: state.review,
        images: state.images,
        recommendations: state.recommendations,
      );
    }
    return Container();
  }
}
