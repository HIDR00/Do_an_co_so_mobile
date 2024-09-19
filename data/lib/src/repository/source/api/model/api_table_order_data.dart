import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_order_data.dart';

part 'api_table_order_data.freezed.dart';
part 'api_table_order_data.g.dart';

@freezed
class ApiTableOrderData with _$ApiTableOrderData {

	const ApiTableOrderData._();

  @JsonSerializable(explicitToJson: true) 
	factory ApiTableOrderData({
		@JsonKey(name: 'status') int? status,
		@JsonKey(name: 'pay_type') int? payType,
		@JsonKey(name: 'orders') List<ApiOrderData>? orders,
	}) = _ApiTableOrderData;

	factory ApiTableOrderData.fromJson(Map<String, dynamic> json) => _$ApiTableOrderDataFromJson(json);
}
