import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import '../../base/base_page_state.dart';
import '../../common_view/common_app_bar.dart';
import '../../common_view/common_scaffold.dart';
import '../../resource/dimens/dimens.dart';
import '../../resource/styles/app_colors.dart';
import '../../resource/styles/app_text_styles.dart';
import 'bloc/order.dart';

@RoutePage()
class OrderPage extends StatefulWidget {
  const OrderPage({required this.lMenuOder, required this.tableId, super.key});
  final List<Menu> lMenuOder;
  final int tableId;
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BasePageState<OrderPage, OrderBloc> {
  late Map<int, int> item;

  @override
  void initState() {
    super.initState();
    bloc.add(OrderPageInitiated(widget.lMenuOder));
    fetchitem();
  }

  double calculateTotal() {
    double total = 0.0;
    for (var itemCategory in widget.lMenuOder) {
      int quantity = item[itemCategory.id] ?? 0;
      total += itemCategory.price * quantity;
    }
    return total;
  }

  void fetchitem() {
    item = {};
    for (var i in widget.lMenuOder) {
      item[i.id] = 1;
    }
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        return CommonScaffold(
          appBar: CommonAppBar(
            text: 'Order',
            centerTitle: true,
            titleTextStyle: AppTextStyles.s20w700Title2(),
            leadingIconColor: AppColors.genericBlack,
          ),
          body: Container(
              padding: const EdgeInsets.only(left: Dimens.d10, right: Dimens.d10, top: Dimens.d15),
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.primaryBG,
              ),
              child: ListView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        state.lAppetizers.isNullOrEmpty
                            ? const SizedBox()
                            : _renderCard(state.lAppetizers, 'Appetizers'),
                        state.lMainCourse.isNullOrEmpty
                            ? const SizedBox()
                            : _renderCard(state.lMainCourse, 'Main Course'),
                        state.lVegetarianDishes.isNullOrEmpty
                            ? const SizedBox()
                            : _renderCard(state.lVegetarianDishes, 'Vegetarian Dishes'),
                        state.lFusionDishes.isNullOrEmpty
                            ? const SizedBox()
                            : _renderCard(state.lFusionDishes, 'Fusion Dishes'),
                        state.lDesserts.isNullOrEmpty ? const SizedBox() : _renderCard(state.lDesserts, 'Desserts'),
                        state.lDrinks.isNullOrEmpty ? const SizedBox() : _renderCard(state.lDrinks, 'Drinks'),
                        const SizedBox(
                          height: Dimens.d20,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      _renderPayment(),
                      const SizedBox(
                        height: Dimens.d20,
                      ),
                      _renderButton(state),
                      const SizedBox(
                        height: Dimens.d20,
                      ),
                    ],
                  ),
                ],
              )),
        );
      },
    );
  }

  Widget _renderButton(OrderState state) {
    return GestureDetector(
      onTap: () {
        bloc.add(
            OrderPagePostOrder(item, widget.lMenuOder, widget.tableId));
      },
      child: Container(
        height: Dimens.d50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.current.baseColors4,
            borderRadius: BorderRadius.circular(Dimens.d10),
            border: Border.all(color: AppColors.current.baseColors4)),
        child: Center(
            child: Text('Order',
                style: AppTextStyles.s20w700Title2()
                    .copyWith(color:Colors.white ))),
      ),
    );
  }

  Widget _renderPayment() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: AppTextStyles.s18w700Title2(),
              ),
              Text(
                calculateTotal().toString(),
                style: AppTextStyles.s18w700Title2(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _renderCard(List<Menu> lMenu, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.d18),
      child: Container(
        padding: const EdgeInsets.all(Dimens.d10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(Dimens.d10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.s18w700Title2(),
            ),
            const SizedBox(
              height: Dimens.d10,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: lMenu.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(top: Dimens.d6),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(Dimens.d10),
                              child: CachedNetworkImage(
                                imageUrl: lMenu[index].imageUrl,
                                height: Dimens.d70,
                                width: Dimens.d100,
                                fit: BoxFit.cover,
                              )),
                          const SizedBox(width: Dimens.d30),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Dimens.d100,
                                child: Text(
                                  lMenu[index].name,
                                  style: AppTextStyles.s14w600Primary(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: Dimens.d5),
                              Container(
                                height: Dimens.d35,
                                width: Dimens.d100,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryBG,
                                    borderRadius: BorderRadius.circular(Dimens.d8),
                                    border: Border.all(color: AppColors.current.baseColors3)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: Dimens.d5, horizontal: Dimens.d5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              item[lMenu[index].id] = (item[lMenu[index].id] ?? 0) - 1;
                                              if (item[lMenu[index].id]! < 0) {
                                                item[lMenu[index].id] = 0;
                                              }
                                            });
                                          },
                                          child: const Icon(Icons.remove, size: Dimens.d20)),
                                      Container(
                                        height: Dimens.d80,
                                        width: Dimens.d30,
                                        decoration: BoxDecoration(
                                            color: AppColors.primaryBG,
                                            borderRadius: BorderRadius.circular(Dimens.d8),
                                            border: Border.all(color: AppColors.current.baseColors3)),
                                        child: Center(
                                            child: Text(
                                          item[lMenu[index].id].toString(),
                                          style: AppTextStyles.s14w400Primary(),
                                        )),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              item[lMenu[index].id] = (item[lMenu[index].id] ?? 0) + 1;
                                            });
                                          },
                                          child: const Icon(Icons.add, size: Dimens.d20)),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: Dimens.d10),
                        child: Text(
                          '\$${lMenu[index].price * item[lMenu[index].id]!.toDouble()}',
                          style: AppTextStyles.s18w700Title2(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
