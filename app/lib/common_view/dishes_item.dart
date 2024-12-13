import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../app.dart';

class DishesItem extends StatelessWidget {
  DishesItem({required this.onTap, super.key, required this.menuItem});
  final Menu menuItem;
  void Function(Menu)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(Dimens.d15)), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 2),
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.d8),
        child: GestureDetector(
          onTap: () => onTap!(menuItem),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.d10),
              child: CachedNetworkImage(
                imageUrl: menuItem.imageUrl,
                height: Dimens.d50,
                width: Dimens.d100,
                fit: BoxFit.fill,
              )),
        ),
      ),
    );
  }
}
