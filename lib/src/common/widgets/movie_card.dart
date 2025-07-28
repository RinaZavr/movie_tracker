import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/common/widgets/mini_accent_item.dart';
import 'package:movie_tracker/src/config/router/routes.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movieId,
    required this.imageUrl,
    required this.vote,
    this.padding,
    this.margin,
  });

  final int movieId;
  final String imageUrl;
  final String vote;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MovieDetailsRoute(id: movieId).push(context);
      },
      child: CachedNetworkImage(
        imageUrl: dotenv.env['IMAGES_URL']! + imageUrl,
        imageBuilder: (context, imageProvider) {
          return IntrinsicWidth(
            child: Container(
              padding: padding,
              margin: margin,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [context.shadowExt.primaryShadow],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image(image: imageProvider, fit: BoxFit.cover),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: MiniAccentItem(
                          child: Text(
                            vote,
                            style: context.textExt.accentInfo.copyWith(
                              color: context.colorExt.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        errorWidget: (context, url, error) {
          return Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }
}
