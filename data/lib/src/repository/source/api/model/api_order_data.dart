import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_order_data.freezed.dart';
part 'api_order_data.g.dart';

@freezed
class ApiOrderData with _$ApiOrderData {

	const ApiOrderData._();
  
  @JsonSerializable(explicitToJson: true)
	factory ApiOrderData({
		@JsonKey(name: 'table_id') int? tableId,
		@JsonKey(name: 'menu_id') int? menuId,
		@JsonKey(name: 'quantity') int? quantity,
	}) = _ApiOrderData;

	factory ApiOrderData.fromJson(Map<String, dynamic> json) => _$ApiOrderDataFromJson(json);
}
