import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import 'bloc/menu.dart';

@RoutePage()
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends BasePageState<MenuPage, MenuBloc> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(const MenuPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        if (state.lCategories.isEmpty) {
          return const CircularProgressIndicator();
        }
        return DefaultTabController(
          length: 5,
          child: CommonScaffold(
            appBar: CommonAppBar(
              text: 'Menu',
              centerTitle: true,
              titleTextStyle: AppTextStyles.s20w700Title2(),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: Dimens.d20, top: Dimens.d15),
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
                    ),
                  ]),
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
                      (index) => TabViewWidget(categories: state.lCategories[index].name),
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
