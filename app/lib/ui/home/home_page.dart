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
                  return TableCommon(
                    index: index,
                    lTable: state.lTable,
                    ontap: () {
                      if(state.lTable[index].status == 1){
                        navigator.showErrorSnackBar('Bàn đã có người');
                      }else{
                        navigator.push(AppRouteInfo.menu(state.lTable[index].id));
                      }
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
