import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiOrderDataMapper extends BaseDataMapper<ApiOrderData, MOrder> with DataMapperMixin  {
  @override
  MOrder mapToEntity(ApiOrderData? data) {
    return MOrder(
      tableId: data?.tableId ?? MOrder.defaultTableId,
      menuId: data?.menuId ?? MOrder.defaultMenuId,
      quantity: data?.quantity ?? MOrder.defaultQuantity,
    );
  }

  
  @override
  ApiOrderData mapToData(MOrder entity) {
    return ApiOrderData(
      tableId: entity.tableId,
      menuId: entity.menuId ,
      quantity: entity.quantity
    );
  }
}
