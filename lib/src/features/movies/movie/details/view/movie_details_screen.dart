import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_tracker/src/common/consts/icons_consts.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/common/widgets/mini_accent_item.dart';
import 'package:movie_tracker/src/features/movies/movie/details/cubit/movie_details_cubit.dart';

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
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              child: MiniAccentItem(
                child: const Icon(AppIcons.back),
                onTap: () => context.pop(),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: MiniAccentItem(
                child: Text(
                  '0.0',
                  style: context.textExt.accentInfo.copyWith(
                    color: context.colorExt.primaryColor,
                  ),
                ),
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: MiniAccentItem(
                child: const Icon(AppIcons.favorite),
                onTap: () {},
              ),
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CachedNetworkImage(
                imageUrl:
                    "${dotenv.env['IMAGES_URL']!}/hZkgoQYus5vegHoetLkCJzb17zJ.jpg",
                imageBuilder: (context, imageProvider) {
                  return IntrinsicWidth(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [context.shadowExt.primaryShadow],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image(image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return Center(child: const CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
