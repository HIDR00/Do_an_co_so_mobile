import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
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
                  return TableCommon(index: index, lTable: state.lTable,ontap: () => navigator.push(AppRouteInfo.guestOder(state.lTable[index].id)),);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
