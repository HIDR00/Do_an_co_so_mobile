import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_order_get_data.dart';

part 'api_table_order_get_data.freezed.dart';
part 'api_table_order_get_data.g.dart';

@freezed
class ApiTableOrderGetData with _$ApiTableOrderGetData {

	const ApiTableOrderGetData._();

	factory ApiTableOrderGetData({
		@JsonKey(name: 'id') int? id,
		@JsonKey(name: 'status') int? status,
		@JsonKey(name: 'pay_type') int? payType,
		@JsonKey(name: 'orders') List<ApiOrderGetData>? orders,
	}) = _ApiTableOrderGetData;

	factory ApiTableOrderGetData.fromJson(Map<String, dynamic> json) => _$ApiTableOrderGetDataFromJson(json);
}
