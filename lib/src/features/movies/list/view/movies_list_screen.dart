import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/widgets/movie_card.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({super.key});

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  final List<String> paths = [
    'https://image.tmdb.org/t/p/original/vsjuHP9RQZJgYUvvSlO3mjJpXkq.jpg',
    'https://image.tmdb.org/t/p/original/vsjuHP9RQZJgYUvvSlO3mjJpXkq.jpg',
    'https://image.tmdb.org/t/p/original/vsjuHP9RQZJgYUvvSlO3mjJpXkq.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              ),
              items: paths
                  .map(
                    (path) => MovieCard(
                      imageUrl: path,
                      margin: const EdgeInsets.all(8),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
