import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app.dart';
import '../bloc/menu.dart';

// ignore: must_be_immutable
class CategoriesWidget extends StatefulWidget {
  CategoriesWidget({required this.lItem, this.onAddToCart, super.key});
  final List<Menu> lItem;
  void Function(Menu)? onAddToCart;

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        return Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryBG,
            ),
            child: Padding(
              padding: const EdgeInsets.all(Dimens.d25),
              child: GridView.builder(
                itemCount: widget.lItem.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: Dimens.d8, mainAxisSpacing: Dimens.d20, childAspectRatio: 0.6),
                itemBuilder: (context, index) {
                  return _renderDishesItem(state, index);
                },
              ),
            ));
      },
    );
  }

  Container _renderDishesItem(MenuState state, int index) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(Dimens.d15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.d8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(Dimens.d10),
                    child: CachedNetworkImage(
                      imageUrl: widget.lItem[index].imageUrl,
                      height: Dimens.d120,
                      fit: BoxFit.fill,
                    )),
                const SizedBox(height: Dimens.d10),
                Text(
                  widget.lItem[index].name,
                  style: AppTextStyles.s14w600Primary(),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_renderPrice(state, index), _renderAddToCard(state, index)],
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _renderAddToCard(MenuState state, int index) {
    return GestureDetector(
      onTap: () => widget.onAddToCart!(widget.lItem[index]),
      child: Container(
        height: Dimens.d25,
        width: Dimens.d25,
        decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(Dimens.d5)),
        child: const Icon(
          Icons.add_shopping_cart_outlined,
          color: Colors.white,
          size: Dimens.d20,
        ),
      ),
    );
  }

  Text _renderPrice(MenuState state, int index) {
    return Text(
      '${widget.lItem[index].price.toString()}đ',
      style: AppTextStyles.s14w400Description(),
    );
  }
}
