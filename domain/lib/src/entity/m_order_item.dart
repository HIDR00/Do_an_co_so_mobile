import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_order_item.freezed.dart';

@freezed
class MOrderItem with _$MOrderItem {
  const factory MOrderItem({
    @Default(-1) int itemId,
    @Default(-1) int quantity,
  }) = _MOrderItem;
}