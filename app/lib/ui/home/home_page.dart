import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:domain/domain.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import '../../common_view/dishes_item.dart';
import 'bloc/home.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends BasePageState<HomePage, HomeBloc> {
  final int _currentPosition = 0;

  @override
  void initState() {
    super.initState();
    bloc.add(const HomePageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous != current,
      bloc: bloc,
      builder: (context, state) {
        return CommonScaffold(
          backgroundColor: AppColors.current.neutral2,
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async => bloc.add(const HomePageInitiated()),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Dimens.d10,
                      horizontal: Dimens.d20,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: Dimens.d10,
                        horizontal: Dimens.d20,
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.current.baseColors2,
                          border: Border.all(color: AppColors.current.baseColors3),
                          borderRadius: BorderRadius.circular(Dimens.d99)),
                      child: Center(
                        child: Text(
                          'Nhà hàng Đức Toản',
                          style: AppTextStyles.s20w700Title2(color: AppColors.primaryBG),
                        ),
                      ),
                    ),
                  ),
                  _buildBannerCarousel(),
                  Padding(
                    padding: const EdgeInsets.only(top: Dimens.d10, bottom: Dimens.d20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: Dimens.d20,
                            right: Dimens.d20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: Dimens.d10,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.location_on),
                                  Text(
                                    'Yên Nghĩa, Q.Hà Đông, Hà Nội',
                                    style: AppTextStyles.s14w400Description(),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: Dimens.d10,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.attach_money),
                                  Text(
                                    '500.000 - 5.000.000 đ/người',
                                    style: AppTextStyles.s14w400Description(),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: Dimens.d10,
                        ),
                        Container(
                          height: Dimens.d10,
                          color: AppColors.current.neutral3,
                        ),
                        const SizedBox(
                          height: Dimens.d10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: Dimens.d20,
                            right: Dimens.d20,
                          ),
                          child: Text(
                            'Các món ăn hot:',
                            style: AppTextStyles.s20w700Title2(),
                          ),
                        ),
                        SizedBox(
                          height: Dimens.d100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.lMenu.data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: Dimens.d20,bottom: Dimens.d10,top: Dimens.d10),
                                child: DishesItem(
                                  menuItem: state.lMenu.data[index],
                                  onTap: (menu) => navigator.push(AppRouteInfo.menuDetail(menu)),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: Dimens.d20,
                            right: Dimens.d20,
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Đặt bàn',
                                style: AppTextStyles.s20w700Title2(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: Dimens.d10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: Dimens.d20,
                            right: Dimens.d20,
                          ),
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: Dimens.d14.responsive(),
                              mainAxisSpacing: Dimens.d14.responsive(),
                              childAspectRatio: 20 / 16,
                            ),
                            itemCount: state.lTable.length,
                            itemBuilder: (context, index) {
                              return TableCommon(
                                index: index,
                                lTable: state.lTable,
                                ontap: () {
                                  if (state.lTable[index].status == 1) {
                                    navigator.showErrorSnackBar('Bàn đã được đặt');
                                  } else if (state.lTable[index].status == 2) {
                                    navigator.showErrorSnackBar('Món ăn đang được chuẩn bị');
                                  } else if (state.lTable[index].status == 3) {
                                    navigator.showErrorSnackBar('Món ăn đã được phục vụ');
                                  } else {
                                    navigator.push(AppRouteInfo.menu(state.lTable[index].id));
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBannerCarousel() {
    final listImageDemo = [
      'https://saigon.newworldhotels.com/wp-content/uploads/sites/18/2014/05/4001-1564-2.jpg',
      'https://saigon.newworldhotels.com/wp-content/uploads/sites/18/2014/05/Parkview-2.jpg',
      'https://saigon.newworldhotels.com/wp-content/uploads/sites/18/2014/05/Parkview.jpg',
      'https://saigon.newworldhotels.com/wp-content/uploads/sites/18/2014/05/DSC08606-1.jpg',
      'https://saigon.newworldhotels.com/wp-content/uploads/sites/18/2014/05/4001-1564-1.jpg',
      'https://saigon.newworldhotels.com/wp-content/uploads/sites/18/2014/05/DSC08581-1.jpg'
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 3,
            viewportFraction: 0.7,
            initialPage: 0,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            disableCenter: false,
            onPageChanged: (index, reason) {
              setState(() {});
            },
            scrollDirection: Axis.horizontal,
          ),
          items: listImageDemo.map((e) {
            return Builder(
              builder: (BuildContext context) {
                return BannerItem(
                  imageUrl: e,
                  onTap: () async {},
                );
              },
            );
          }).toList(),
        ),
        DotsIndicator(
          dotsCount: listImageDemo.length,
          position: _currentPosition,
          decorator: DotsDecorator(
            activeColor: AppColors.current.baseColors3,
            spacing: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
          ),
        )
      ],
    );
  }
}
