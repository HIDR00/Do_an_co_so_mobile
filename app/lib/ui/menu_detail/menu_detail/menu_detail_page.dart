import 'package:app/common_view/dishes_item.dart';
import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app.dart';

@RoutePage()
class MenuDetailPage extends StatefulWidget {
  const MenuDetailPage({required this.menu, super.key});
  final Menu menu;

  @override
  State<StatefulWidget> createState() {
    return _MenuDetailPageState();
  }
}

class _MenuDetailPageState extends BasePageState<MenuDetailPage, MenuDetailBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const MenuDetailPageInitiated());
  }

  List<Menu> getListMenu(ListMenu lMenu, int categoriesId) {
    return lMenu.data.where((i) => i.categoriesId == categoriesId).toList();
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<MenuDetailBloc, MenuDetailState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return Scaffold(
              appBar: CommonAppBar(
                leadingIconColor: AppColors.genericBlack,
              ),
              body: Container(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _renderImage(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Dimens.d14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: Dimens.d20,
                            ),
                            Text(
                              widget.menu.name,
                              style: AppTextStyles.s20w700Title2(),
                            ),
                            const SizedBox(
                              height: Dimens.d10,
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                              const Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 252, 194, 4),
                              ),
                              const SizedBox(
                                width: Dimens.d5,
                              ),
                              Text(
                                '4.5  -  15 mins',
                                style: AppTextStyles.s12w400Description(),
                              ),
                            ]),
                            const SizedBox(
                              height: Dimens.d10,
                            ),
                            Text(
                              widget.menu.discription,
                              style: AppTextStyles.s14w400Description(),
                            ),
                            const SizedBox(
                              height: Dimens.d20,
                            ),
                            // _renderButoon(),
                            const SizedBox(
                              height: Dimens.d20,
                            ),
                            Text(
                              'Món khác:',
                              style: AppTextStyles.s20w700Title2(),
                            ),
                            const SizedBox(
                              height: Dimens.d20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimens.d100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.lMenu.data.length,
                          itemBuilder: (context, index) {
                            if(state.lMenu.data[index].name == widget.menu.name){
                              return Container();
                            }
                            return Padding(
                              padding: const EdgeInsets.all(Dimens.d10),
                              child: DishesItem(
                                menuItem: state.lMenu.data[index],
                                onTap: (menu) => navigator.push(AppRouteInfo.menuDetail(menu)),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: Dimens.d20,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Row _renderButoon() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: Dimens.d50,
            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(Dimens.d10), boxShadow: [
              BoxShadow(
                color: AppColors.current.primaryTextColor.withOpacity(0.08),
                offset: const Offset(0, 2.0),
                blurRadius: Dimens.d2,
                spreadRadius: 1.0,
              ),
            ]),
            child: Center(
                child: Text(widget.menu.price.toString(),
                    style: AppTextStyles.s18w700Title2().copyWith(color: Colors.white))),
          ),
        ),
        const SizedBox(
          width: Dimens.d20,
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: Dimens.d50,
            decoration: BoxDecoration(
                color: AppColors.current.baseColors4,
                borderRadius: BorderRadius.circular(Dimens.d10),
                border: Border.all(color: AppColors.current.baseColors4),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.current.primaryTextColor.withOpacity(0.08),
                    offset: const Offset(0, 2.0),
                    blurRadius: Dimens.d2,
                    spreadRadius: 3.0,
                  ),
                ]),
            child:
                Center(child: Text('Add to Card', style: AppTextStyles.s20w700Title2().copyWith(color: Colors.white))),
          ),
        ),
      ],
    );
  }

  ClipRRect _renderImage() {
    return ClipRRect(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(Dimens.d30),bottomRight: Radius.circular(Dimens.d30)),
        child: CachedNetworkImage(
          imageUrl: widget.menu.imageUrl,
          height: Dimens.d400,
          width: double.infinity,
          fit: BoxFit.fill,
        ));
  }
}
