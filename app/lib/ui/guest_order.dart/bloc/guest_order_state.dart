import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_state.dart';

part 'guest_order_state.freezed.dart';

@freezed
class GuestOrderState extends BaseBlocState with _$GuestOrderState {
  factory GuestOrderState({
    @Default(false) bool isShimmerLoading,
    @Default(TableOrderGet()) TableOrderGet loder
  }) = _GuestOrderState;
}
