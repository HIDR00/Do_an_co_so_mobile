import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_state.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState extends BaseBlocState with _$OrderState {
  factory OrderState({
    @Default(false) bool isShimmerLoading,
    @Default(<Menu>[]) List<Menu> lAppetizers,
    @Default(<Menu>[]) List<Menu> lMainCourse,
    @Default(<Menu>[]) List<Menu> lVegetarianDishes,
    @Default(<Menu>[]) List<Menu> lFusionDishes,
    @Default(<Menu>[]) List<Menu> lDesserts,
    @Default(<Menu>[]) List<Menu> lDrinks,
    @Default(<int, int>{}) Map<int, int> item,
    @Default(ListDevice()) ListDevice listDevice,
  }) = _OrderState;
}
