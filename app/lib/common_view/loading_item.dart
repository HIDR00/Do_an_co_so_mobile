import 'package:flutter/material.dart';

import '../app.dart';

class LoadingItem extends StatelessWidget {
  const LoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return RounedRectangleShimmer(
      width: double.infinity,
      height: Dimens.d60.responsive(),
    );
  }
}