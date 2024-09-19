import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'table_order.freezed.dart';

@freezed
class TableOrder with _$TableOrder {
  const factory TableOrder({
    @Default(TableOrder.defaultStatus) int status,
    @Default(TableOrder.defaultPayType) int payType,
    @Default(TableOrder.defaultOrders) List<MOrder> orders,
  }) = _User;

  static const defaultStatus = 0;
  static const defaultPayType = 0;
  static const defaultOrders = <MOrder>[];
}
