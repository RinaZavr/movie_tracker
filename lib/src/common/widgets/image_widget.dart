import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_tracker/src/common/consts/icons_consts.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.imageUrl,
    this.child,
    this.padding,
    this.margin,
    this.aspectRatio,
  });

  final String? imageUrl;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? aspectRatio;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio ?? 2 / 3,
      child: IntrinsicWidth(
        child: Container(
          padding: padding,
          margin: margin,
          decoration: BoxDecoration(
            color: context.colorExt.cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [context.shadowExt.primaryShadow],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: dotenv.env['IMAGES_URL']! + (imageUrl ?? ''),
              imageBuilder: (context, imageProvider) {
                return child == null
                    ? getImage(imageProvider: imageProvider)
                    : Stack(
                        fit: StackFit.expand,
                        children: [
                          getImage(imageProvider: imageProvider),
                          child!,
                        ],
                      );
              },
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                );
              },
              errorWidget: (context, error, stackTrace) {
                return Center(
                  child: Icon(
                    AppIcons.photo,
                    size: 48,
                    color: context.colorExt.errorColor,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget getImage({required ImageProvider imageProvider}) {
    return Image(image: imageProvider, fit: BoxFit.cover);
  }
}
