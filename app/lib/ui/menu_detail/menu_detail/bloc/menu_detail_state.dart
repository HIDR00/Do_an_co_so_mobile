import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app.dart';

part 'menu_detail_state.freezed.dart';

@freezed
class MenuDetailState extends BaseBlocState with _$MenuDetailState {
  const MenuDetailState._();

  const factory MenuDetailState({
    @Default('') String id,
    @Default(ListMenu()) ListMenu lMenu,
  }) = _MenuDetailState;
}
