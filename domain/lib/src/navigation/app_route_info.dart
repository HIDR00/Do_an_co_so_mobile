import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'app_route_info.freezed.dart';

/// page
@freezed
class AppRouteInfo with _$AppRouteInfo {
  const factory AppRouteInfo.login() = _Login;
  const factory AppRouteInfo.main() = _Main;
  const factory AppRouteInfo.itemDetail(User user) = _UserDetail;
  const factory AppRouteInfo.menu(int tableId) = _MenuPage;
  const factory AppRouteInfo.order(List<Menu> lMenu, int tableId) = _OrderPage;
  const factory AppRouteInfo.myPage() = _MyPagePage;
  const factory AppRouteInfo.search() = _SearchPage;
  const factory AppRouteInfo.guestOder(int tableId) = _GuestOrderPage;
}
