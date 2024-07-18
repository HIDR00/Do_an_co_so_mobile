import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_state.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState extends BaseBlocState with _$OrderState {
  factory OrderState({
    @Default(false) bool isShimmerLoading,
    @Default(<MItemCategories>[]) List<MItemCategories> lBeverages,
    @Default(<MItemCategories>[]) List<MItemCategories> lAppetizers,
    @Default(<MItemCategories>[]) List<MItemCategories> lMainCourse,
    @Default(<MItemCategories>[]) List<MItemCategories> lDesserts,
    @Default(<MItemCategories>[]) List<MItemCategories> lSalads,
    @Default(<int, int>{}) Map<int, int> item,
  }) = _OrderState;
}
