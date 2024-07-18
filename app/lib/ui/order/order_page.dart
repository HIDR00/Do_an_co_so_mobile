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
  const OrderPage({required this.lItemCategoriesOder, super.key});
  final List<MItemCategories> lItemCategoriesOder;
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BasePageState<OrderPage, OrderBloc> {
  late Map<int, int> item;
  String? dropdownValue = 'Chuyển khoản';

  @override
  void initState() {
    super.initState();
    bloc.add(OrderPageInitiated(widget.lItemCategoriesOder));
    fetchitem();
  }

  void fetchitem() {
    item = {};
    for (var i in widget.lItemCategoriesOder) {
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
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.primaryBG,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: Dimens.d10, right: Dimens.d10, top: Dimens.d15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      state.lBeverages.isNullOrEmpty
                          ? const SizedBox()
                          : _renderCard(state.lBeverages, 'Beverages'),
                      state.lAppetizers.isNullOrEmpty
                          ? const SizedBox()
                          : _renderCard(state.lAppetizers, 'Appetizers'),
                      state.lMainCourse.isNullOrEmpty
                          ? const SizedBox()
                          : _renderCard(state.lMainCourse, 'Main Course'),
                      state.lDesserts.isNullOrEmpty
                          ? const SizedBox()
                          : _renderCard(state.lDesserts, 'Desserts'),
                      state.lSalads.isNullOrEmpty
                          ? const SizedBox()
                          : _renderCard(state.lSalads, 'Vegetarian'),
                      const SizedBox(
                        height: Dimens.d20,
                      ),
                      _renderPayment(),
                      const SizedBox(
                        height: Dimens.d20,
                      ),
                      Container(
                        height: Dimens.d50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: dropdownValue == 'Chuyển khoản' ? AppColors.current.baseColors4 : null,
                          borderRadius: BorderRadius.circular(Dimens.d10),
                          border: Border.all(color: AppColors.current.baseColors4)
                        ),
                        child: Center(child: Text(dropdownValue == 'Chuyển khoản' ? 'Pay' : 'Oder',style: AppTextStyles.s20w700Title2().copyWith(color: dropdownValue == 'Chuyển khoản' ? Colors.white : AppColors.current.baseColors4))),
                      ),
                      const SizedBox(
                        height: Dimens.d20,
                      ),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }

  Container _renderPayment() {
    return Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.current.baseColors2, width: 0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Payment Method',
            style: AppTextStyles.s18w700Title2(),
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            iconSize: 24,
            elevation: 16,
            style: AppTextStyles.s12w400Description(),
            onChanged: (String? newValue) {
              // Cho phép newValue có thể là null
              setState(() {
                if (newValue != null) {
                  // Kiểm tra nếu newValue không phải là null mới cập nhật
                  dropdownValue = newValue;
                }
              });
            },
            items: <String>['Chuyển khoản', 'Thanh toán bằng tiền mặt']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _renderCard(List<MItemCategories> itemCategories, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.d18),
      child: Container(
        padding: const EdgeInsets.all(Dimens.d10),
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(Dimens.d10)),
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
              itemCount: itemCategories.length,
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
                                imageUrl: itemCategories[index].image,
                                height: Dimens.d70,
                                fit: BoxFit.cover,
                              )),
                          const SizedBox(width: Dimens.d30),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                itemCategories[index].name,
                                style: AppTextStyles.s14w600Primary(),
                                overflow: TextOverflow.ellipsis,
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: Dimens.d5, horizontal: Dimens.d5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              item[itemCategories[index].id] =
                                                  (item[itemCategories[index].id] ?? 0) - 1;
                                              if(item[itemCategories[index].id]! < 0){
                                                item[itemCategories[index].id] = 0;
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
                                            border:
                                                Border.all(color: AppColors.current.baseColors3)),
                                        child: Center(
                                            child: Text(
                                          item[itemCategories[index].id].toString(),
                                          style: AppTextStyles.s14w400Primary(),
                                        )),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              item[itemCategories[index].id] =
                                                  (item[itemCategories[index].id] ?? 0) + 1;
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
                          '\$${itemCategories[index].price * item[itemCategories[index].id]!.toDouble()}',
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
