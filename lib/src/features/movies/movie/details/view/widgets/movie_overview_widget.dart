import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/features/movies/utils/utils.dart';

class MovieOverviewWidget extends StatelessWidget {
  const MovieOverviewWidget({super.key, required this.overview});

  final String overview;

  @override
  Widget build(BuildContext context) {
    final overwiewRecord = splitFirstSentence(overview);

    return overwiewRecord.$2.isNotEmpty
        ? ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: Text(
              overwiewRecord.$1,
              style: context.textExt.base,
              textAlign: TextAlign.start,
            ),
            children: [Text(overwiewRecord.$2, style: context.textExt.base)],
          )
        : Text(
            overwiewRecord.$1,
            style: context.textExt.base,
            textAlign: TextAlign.start,
          );
  }
}
