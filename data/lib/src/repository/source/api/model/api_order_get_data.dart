import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data.dart';

part 'api_order_get_data.freezed.dart';
part 'api_order_get_data.g.dart';

@freezed
class ApiOrderGetData with _$ApiOrderGetData {

	const ApiOrderGetData._();
  
  @JsonSerializable(explicitToJson: true)
	factory ApiOrderGetData({
		@JsonKey(name: 'table_id') int? tableId,
		@JsonKey(name: 'menu_id') int? menuId,
		@JsonKey(name: 'quantity') int? quantity,
    @JsonKey(name: 'menu') ApiMenuData? menu,
	}) = _ApiOrderGetData;

	factory ApiOrderGetData.fromJson(Map<String, dynamic> json) => _$ApiOrderGetDataFromJson(json);
}
