import 'package:auto_route/annotations.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import 'bloc/menu.dart';

@RoutePage()
class MenuPage extends StatefulWidget {
  const MenuPage({required this.tableId, super.key});
  final int tableId;

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends BasePageState<MenuPage, MenuBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const MenuPageInitiated());
  }

  List<Menu> getListMenu(ListMenu lMenu, int categoriesId) {
    return lMenu.data.where((i) => i.categoriesId == categoriesId).toList();
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state.lCategories.isEmpty) {
          return const CircularProgressIndicator();
        }
        return DefaultTabController(
          length: state.lCategories.length,
          child: CommonScaffold(
            appBar: CommonAppBar(
              text: 'Menu',
              centerTitle: true,
              titleTextStyle: AppTextStyles.s20w700Title2(),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: Dimens.d20, top: Dimens.d15),
                  child: GestureDetector(
                    onTap: () {
                      navigator.push(AppRouteInfo.order(state.lMenuOder, widget.tableId));
                    },
                    child: Stack(children: [
                      Assets.images.bag.svg(),
                      Container(
                        margin: const EdgeInsets.only(left: Dimens.d15, top: Dimens.d1),
                        height: Dimens.d18,
                        width: Dimens.d18,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Center(
                            child: Text(state.lMenuOder.length.toString(),
                                style: AppTextStyles.s12w400Description().copyWith(color: AppColors.primaryBG))),
                      ),
                    ]),
                  ),
                )
              ],
              leadingIconColor: AppColors.genericBlack,
            ),
            body: Column(
              children: [
                const SizedBox(height: Dimens.d8),
                TabBar(
                  tabs: List<Widget>.generate(
                    state.lCategories.length,
                    (index) => Tab(text: state.lCategories[index].name),
                  ),
                  labelColor: AppColors.genericBlack,
                  isScrollable: true,
                  indicatorColor: AppColors.current.neutral1,
                ),
                Expanded(
                  child: TabBarView(
                    children: List<Widget>.generate(
                      state.lCategories.length,
                      (index) => CategoriesWidget(
                        lItem: getListMenu(state.lMenu, state.lCategories[index].id),
                        onTap: (menu) => navigator.push(AppRouteInfo.menuDetail(menu)),
                        onAddToCart: (menu) {
                          if (state.lMenuOder.contains(menu)) {
                          } else {
                            bloc.add(TabViewAddOrder(menu));
                          }
                          navigator.showErrorSnackBar('Món ăn đã được chọn');
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
