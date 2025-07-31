import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/common/widgets/category_widget.dart';
import 'package:movie_tracker/src/common/widgets/review_widget.dart';
import 'package:movie_tracker/src/features/movies/utils/utils.dart';
import 'package:movies_api/api_client.dart';

class MovieReviewWidget extends StatelessWidget {
  const MovieReviewWidget({super.key, required this.review});

  final MovieReview? review;

  @override
  Widget build(BuildContext context) {
    return CategoryWidget(
      title: context.l10n.movieReviews,
      onTap: () {},
      maxHeight:
          calculateTextHeight(
            text: review?.content != null
                ? splitFirstSentence(review!.content).$1
                : 'Отзывов пока нет, попробуйте сменить язык на экране Отзывы',
            style: context.textExt.base,
            maxWidth: MediaQuery.of(context).size.width - 32,
          ) +
          MediaQuery.of(context).size.width * 0.12,
      error: 'Отзывов пока нет, попробуйте сменить язык на экране Отзывы',
      child: review == null
          ? null
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ReviewWidget(review: review!, needScroll: true),
            ),
    );
  }
}
