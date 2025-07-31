import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/common/widgets/category_widget.dart';
import 'package:movie_tracker/src/common/widgets/image_widget.dart';

class MovieGalleryWidget extends StatelessWidget {
  const MovieGalleryWidget({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CategoryWidget(
      title: context.l10n.movieGallery,
      onTap: () {},
      maxHeight: MediaQuery.of(context).size.height * 0.1,
      error: 'Галерея пуста',
      child: images.isEmpty
          ? null
          : ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 8),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ImageWidget(
                  aspectRatio: 16 / 9,
                  margin: index == 0 ? const EdgeInsets.only(left: 16) : null,
                  imageUrl: images[index],
                );
              },
              itemCount: images.length < 10 ? images.length : 10,
              shrinkWrap: true,
            ),
    );
  }
}
