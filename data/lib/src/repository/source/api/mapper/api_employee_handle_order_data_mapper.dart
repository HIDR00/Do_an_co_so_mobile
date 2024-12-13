import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiEmployeeHandleOrderDataMapper extends BaseDataMapper<ApiEmployeeHandleOrderData, EmployeeHandleOrder> {
  @override
  EmployeeHandleOrder mapToEntity(ApiEmployeeHandleOrderData? data) {
    return EmployeeHandleOrder(
      totalPrice: data?.totalPrice ?? EmployeeHandleOrder.defaultTotalPrice,
      tableId: data?.tableId ?? EmployeeHandleOrder.defaultTableId,
      tableStatus: data?.tableStatus ?? EmployeeHandleOrder.defaultTableStatus,
      userId: data?.userId ?? EmployeeHandleOrder.defaultUserId,
    );
  }

  @override
  ApiEmployeeHandleOrderData mapToData(EmployeeHandleOrder? entity) {
    return ApiEmployeeHandleOrderData(
      tableId: entity?.tableId,
      tableStatus:  entity?.tableStatus,
      totalPrice: entity?.totalPrice,
      userId: entity?.userId
    );
  }
}
