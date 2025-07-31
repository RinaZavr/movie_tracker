import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/common/widgets/avatar_widget.dart';
import 'package:movie_tracker/src/features/movies/utils/utils.dart';
import 'package:movies_api/api_client.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
    required this.review,
    this.needScroll = false,
  });

  final MovieReview review;
  final bool needScroll;

  @override
  Widget build(BuildContext context) {
    log(review.toString());
    return Column(
      children: [
        Row(
          spacing: 8,
          children: [
            AvatarWidget(path: review.user.getAvatar()),
            Expanded(
              child: Text(
                review.user.username,
                style: context.textExt.base,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              formatDate(review.createdAt, context),
              style: context.textExt.info.copyWith(
                color: context.colorExt.hintColor,
              ),
            ),
          ],
        ),
        Expanded(
          child: needScroll
              ? SingleChildScrollView(
                  child: Text(review.content, style: context.textExt.base),
                )
              : Text(review.content, style: context.textExt.base),
        ),
      ],
    );
  }
}
