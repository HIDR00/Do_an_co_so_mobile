import 'package:freezed_annotation/freezed_annotation.dart';


part 'api_order_item_data.freezed.dart';
part 'api_order_item_data.g.dart';

@freezed
class ApiOderItemData with _$ApiOderItemData {
  const factory ApiOderItemData({
    @JsonKey(name: 'itemId') int? itemId,
    @JsonKey(name: 'quantity') int? quantity,
  }) = _ApiOderItemData;

  factory ApiOderItemData.fromJson(Map<String, dynamic> json) =>
      _$ApiOderItemDataFromJson(json);
}
