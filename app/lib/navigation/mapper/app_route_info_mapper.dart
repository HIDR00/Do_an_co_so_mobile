import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../app.dart';

@LazySingleton(as: BaseRouteInfoMapper)
class AppRouteInfoMapper extends BaseRouteInfoMapper {
  @override
  PageRouteInfo map(AppRouteInfo appRouteInfo) {
    return appRouteInfo.when(
      login: () => const LoginRoute(),
      main: () => const MainRoute(),
      itemDetail: (user) => ItemDetailRoute(user: user),
      menu: (tableId) => MenuRoute(tableId: tableId),
      order:(lMenu, tableId) => OrderRoute(lMenuOder: lMenu,tableId: tableId),
      myPage: () => const MyPageRoute(),
      search: () => const SearchRoute(),
      guestOder: (tableId) =>  GuestOrderRoute(tableId: tableId),
      qrPaymen: (amount) => QrPaymentRoute(amount: amount),
      menuDetail: (menu) => MenuDetailRoute(menu: menu),
    );
  }
}
