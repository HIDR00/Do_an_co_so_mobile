import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_state.dart';

part 'menu_state.freezed.dart';

@freezed
class MenuState extends BaseBlocState with _$MenuState {
  factory MenuState({
    @Default(false) bool isShimmerLoading,
    @Default(<MCategories>[]) List<MCategories> lCategories,
    @Default(<MItemCategories>[]) List<MItemCategories> lItemCategories,
    @Default(<MItemCategories>[]) List<MItemCategories> lItemCategoriesOder
  }) = _MenuState;
}
