import 'package:app/app.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class BannerItem extends StatelessWidget {
  const BannerItem({
    required String imageUrl,
    this.onTap,
    super.key,
  })  : _imageUrl = imageUrl;

  final VoidCallback? onTap;
  final String _imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.d10),
              child: CachedNetworkImage(
                imageUrl: _imageUrl,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
