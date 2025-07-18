import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/common/widgets/movie_card.dart';
import 'package:movie_tracker/src/features/movies/root/view/widgets/movies_category_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final List<String> topRated = [
    'https://image.tmdb.org/t/p/original/vsjuHP9RQZJgYUvvSlO3mjJpXkq.jpg',
    'https://image.tmdb.org/t/p/original/vsjuHP9RQZJgYUvvSlO3mjJpXkq.jpg',
    'https://image.tmdb.org/t/p/original/vsjuHP9RQZJgYUvvSlO3mjJpXkq.jpg',
  ];

  final List<String> populars = [
    'https://image.tmdb.org/t/p/original/mqZ2diaYaGatU88oGIOzzvQyfdf.jpg',
    'https://image.tmdb.org/t/p/original/mqZ2diaYaGatU88oGIOzzvQyfdf.jpg',
    'https://image.tmdb.org/t/p/original/mqZ2diaYaGatU88oGIOzzvQyfdf.jpg',
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
              items: topRated
                  .map(
                    (path) => Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        MovieCard(
                          imageUrl: path,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
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
                            'Пираты Карибского моря: Сундук мертвеца',
                            style: context.textExt.title,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
          SliverToBoxAdapter(
            child: MoviesCategoryWidget(
              title: context.l10n.popularMovies,
              movies: populars,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: MoviesCategoryWidget(
                title: context.l10n.nowPlayingMovies,
                movies: populars,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 80),
              child: MoviesCategoryWidget(
                title: context.l10n.upcomingMovies,
                movies: populars,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
