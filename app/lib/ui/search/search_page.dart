import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:domain/domain.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import 'bloc/search.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends BasePageState<SearchPage, SearchBloc> {
  final int _currentPosition = 0;
  @override
  void initState() {
    super.initState();
    bloc.add(const SearchPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: bloc,
      builder: (context, state) {
        return CommonScaffold(
          backgroundColor: AppColors.current.neutral2,
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async => bloc.add(const SearchPageInitiated()),
              child: SingleChildScrollView(
                child: Column(
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
                    GridView.builder(
                      padding: const EdgeInsets.all(Dimens.d10),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
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
                              if (state.lTable[index].status > 0) {
                                navigator.push(AppRouteInfo.guestOder(state.lTable[index].id));
                              } else {
                                navigator.showErrorSnackBar('Bàn hiện tại chưa có order');
                              }
                            });
                      },
                    ),
                  ],
                ),
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
