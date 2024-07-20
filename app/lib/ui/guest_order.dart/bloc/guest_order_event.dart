import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_event.dart';

part 'guest_order_event.freezed.dart';

abstract class GuestOrderEvent extends BaseBlocEvent {
  const GuestOrderEvent();
}

@freezed
class GuestOrderPageInitiated extends GuestOrderEvent with _$GuestOrderPageInitiated {
  const factory GuestOrderPageInitiated(int tableId) = _GuestOrderPageInitiated;
}

@freezed
class GuestOrderPageFreeTable extends GuestOrderEvent with _$GuestOrderPageFreeTable {
  const factory GuestOrderPageFreeTable(int tableId) = _GuestOrderPageFreeTable;
}

