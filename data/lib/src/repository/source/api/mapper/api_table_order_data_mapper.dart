import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiTableOrderDataMapper extends BaseDataMapper<ApiTableOrderData, TableOrder> with DataMapperMixin {
  ApiTableOrderDataMapper(
    this._apiOrderDataMapper,
  );

  final ApiOrderDataMapper _apiOrderDataMapper;

  @override
  TableOrder mapToEntity(ApiTableOrderData? data) {
    return TableOrder(
      status: data?.status ?? TableOrder.defaultStatus,
      payType: data?.payType ?? TableOrder.defaultPayType,
      orders: _apiOrderDataMapper.mapToListEntity(data?.orders),
    );
  }

  @override
  ApiTableOrderData mapToData(TableOrder? entity) {
    return ApiTableOrderData(
      status: entity?.status ?? TableOrder.defaultStatus,
      payType: entity?.payType ?? TableOrder.defaultPayType,
      orders: _apiOrderDataMapper.mapToListData(entity?.orders),
    );
  }
}
