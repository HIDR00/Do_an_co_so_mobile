import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_employee_handle_order_data.freezed.dart';
part 'api_employee_handle_order_data.g.dart';

@freezed
class ApiEmployeeHandleOrderData with _$ApiEmployeeHandleOrderData {
  const ApiEmployeeHandleOrderData._();

  factory ApiEmployeeHandleOrderData({
    @JsonKey(name: 'total_price') double? totalPrice,
    @JsonKey(name: 'table_id') int? tableId,
    @JsonKey(name: 'table_status') int? tableStatus,
    @JsonKey(name: 'user_id') int? userId,
  }) = _ApiEmployeeHandleOrderData;

  factory ApiEmployeeHandleOrderData.fromJson(Map<String, dynamic> json) => _$ApiEmployeeHandleOrderDataFromJson(json);
}
