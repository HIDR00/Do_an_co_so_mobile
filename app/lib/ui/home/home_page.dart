import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
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
  // late final _pagingController = CommonPagingController<User>()..disposeBy(disposeBag);

  @override
  void initState() {
    super.initState();
    bloc.add(const HomePageInitiated());
    // _pagingController.listen(
    //   onLoadMore: () => bloc.add(const UserLoadMore()),
    // );
  }

  // @override
  // Widget buildPageListeners({required Widget child}) {
  //   return MultiBlocListener(
  //     listeners: [
  //       BlocListener<HomeBloc, HomeState>(
  //         listenWhen: (previous, current) => previous.users != current.users,
  //         listener: (context, state) {
  //           _pagingController.appendLoadMoreOutput(state.users);
  //         },
  //       ),
  //       BlocListener<HomeBloc, HomeState>(
  //         listenWhen: (previous, current) =>
  //             previous.loadUsersException != current.loadUsersException,
  //         listener: (context, state) {
  //           _pagingController.error = state.loadUsersException;
  //         },
  //       ),
  //     ],
  //     child: child,
  //   );
  // }

  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: bloc,
      builder: (context, state) {
        return CommonScaffold(
          backgroundColor: AppColors.current.neutral2,
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(Dimens.d10),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Dimens.d14.responsive(),
                  mainAxisSpacing: Dimens.d14.responsive(),
                  childAspectRatio: 16 / 14,
                ),
                itemCount: state.lTable.length,
                itemBuilder: (context, index) {
                  return _renderTable(index,state);
                },
              ),
            ),
            // child: BlocBuilder<HomeBloc, HomeState>(
            //   buildWhen: (previous, current) =>
            //       previous.users != current.users ||
            //       previous.isShimmerLoading != current.isShimmerLoading,
            //   builder: (context, state) {
            //     return RefreshIndicator(
            //       onRefresh: () {
            //         final completer = Completer<void>();
            //         bloc.add(HomePageRefreshed(completer: completer));

            //         return completer.future;
            //       },
            //       child: state.isShimmerLoading && state.users.data.isEmpty
            //           ? const _ListViewLoader()
            //           : CommonPagedListView<User>(
            //               pagingController: _pagingController,
            //               itemBuilder: (context, user, index) {
            //                 return Padding(
            //                   padding: EdgeInsets.symmetric(
            //                     horizontal: Dimens.d8.responsive(),
            //                     vertical: Dimens.d4.responsive(),
            //                   ),
            //                   child: ShimmerLoading(
            //                     isLoading: state.isShimmerLoading,
            //                     loadingWidget: const _LoadingItem(),
            //                     child: GestureDetector(
            //                       onTap: () async {
            //                         await navigator.push(AppRouteInfo.itemDetail(user));
            //                       },
            //                       child: Container(
            //                         alignment: Alignment.center,
            //                         decoration: BoxDecoration(
            //                           color: AppColors.current.primaryColor,
            //                           borderRadius: BorderRadius.circular(Dimens.d8.responsive()),
            //                         ),
            //                         width: double.infinity,
            //                         height: Dimens.d60.responsive(),
            //                         child: Text(
            //                           user.email,
            //                           style: AppTextStyles.s14w400Primary(),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 );
            //               },
            //             ),
            //     );
            //   },
            // ),
          ),
        );
      },
    );
  }

  GestureDetector _renderTable(int index,HomeState state) {
    return GestureDetector(
      onTap: () {
        navigator.push(const AppRouteInfo.menu());
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.current.bgTable,
            borderRadius: BorderRadius.circular(Dimens.d30),
            border: state.lTable[index].status != 'FREE' ? Border.all(color: AppColors.current.borderTable,width: Dimens.d2) : null,
            boxShadow: [
              BoxShadow(
                color: AppColors.genericBlack.withOpacity(0.05),
                blurRadius: Dimens.d10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(Dimens.d20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('Bàn số ${index + 1}', style: AppTextStyles.s18w700Title2())],
            ),
          ),
        ),
      ),
    );
  }
}

// class _LoadingItem extends StatelessWidget {
//   const _LoadingItem();

//   @override
//   Widget build(BuildContext context) {
//     return RounedRectangleShimmer(
//       width: double.infinity,
//       height: Dimens.d60.responsive(),
//     );
//   }
// }

// /// Because [PagedListView] does not expose the [itemCount] property, itemCount = 0 on the first load and thus the Shimmer loading effect can not work. We need to create a fake ListView for the first load.
// class _ListViewLoader extends StatelessWidget {
//   const _ListViewLoader();

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: UiConstants.shimmerItemCount,
//       itemBuilder: (context, index) => Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: Dimens.d8.responsive(),
//           vertical: Dimens.d4.responsive(),
//         ),
//         child: const ShimmerLoading(
//           loadingWidget: _LoadingItem(),
//           isLoading: true,
//           child: _LoadingItem(),
//         ),
//       ),
//     );
//   }
// }
