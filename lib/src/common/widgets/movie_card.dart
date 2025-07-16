import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.imageUrl,
    this.padding,
    this.margin,
  });

  final String imageUrl;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          padding: padding,
          margin: margin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [context.shadowExt.primaryShadow],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(image: imageProvider, fit: BoxFit.cover),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return const CircularProgressIndicator();
      },
    );
  }
}
