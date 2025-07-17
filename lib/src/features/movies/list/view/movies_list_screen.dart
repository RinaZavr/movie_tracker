import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/widgets/custom_app_bar.dart';
import 'package:movie_tracker/src/common/widgets/movie_card.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({
    super.key,
    required this.title,
    required this.images,
  });

  final String title;
  final List<String> images;

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.title),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.7,
          ),
          itemCount: widget.images.length,
          itemBuilder: (context, index) {
            return MovieCard(imageUrl: widget.images[index]);
          },
        ),
      ),
    );
  }
}
