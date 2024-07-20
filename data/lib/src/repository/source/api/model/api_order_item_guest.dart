import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_order_item_guest.freezed.dart';
part 'api_order_item_guest.g.dart';

@freezed
class ApiOderItemGuestData with _$ApiOderItemGuestData {
  const factory ApiOderItemGuestData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'item') String? item,
    @JsonKey(name: 'quantity') int? quantity,
    @JsonKey(name: 'price') double? price,
  }) = _ApiOderItemGuestData;

  factory ApiOderItemGuestData.fromJson(Map<String, dynamic> json) =>
      _$ApiOderItemGuestDataFromJson(json);
}
