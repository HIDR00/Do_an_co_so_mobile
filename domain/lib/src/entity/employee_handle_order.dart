import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_handle_order.freezed.dart';

@freezed
class EmployeeHandleOrder with _$EmployeeHandleOrder {
  const factory EmployeeHandleOrder({
    @Default(EmployeeHandleOrder.defaultTotalPrice) double totalPrice,
    @Default(EmployeeHandleOrder.defaultTableId) int tableId,
    @Default(EmployeeHandleOrder.defaultTableStatus) int tableStatus,
    @Default(EmployeeHandleOrder.defaultUserId) int userId,
  }) = _User;

  static const defaultTotalPrice = 0.0;
  static const defaultTableId = 0;
  static const defaultTableStatus = 0;
  static const defaultUserId = 0;
}
