import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_order.freezed.dart';

@freezed
class MOrder with _$MOrder {
  const factory MOrder({
    @Default(MOrder.defaultTableId) int tableId,
    @Default(MOrder.defaultMenuId) int menuId,
    @Default(MOrder.defaultQuantity) int quantity,
  }) = _User;

  static const defaultTableId = 0;
  static const defaultMenuId = 0;
  static const defaultQuantity = 0;
}
