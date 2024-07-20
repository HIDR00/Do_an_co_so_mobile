import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data.dart';

part 'api_list_oder_item_guest_data.freezed.dart';
part 'api_list_oder_item_guest_data.g.dart';

@freezed
class ApiListOderItemGuestData with _$ApiListOderItemGuestData {
  const factory ApiListOderItemGuestData({
    @JsonKey(name: 'orderDetails') List<ApiOderItemGuestData>? apiOderItemGuestData,
  }) = _ApiListOderItemGuestData;

  factory ApiListOderItemGuestData.fromJson(Map<String, dynamic> json) =>
      _$ApiListOderItemGuestDataFromJson(json);
}
