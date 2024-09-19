import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiOrderGetDataMapper extends BaseDataMapper<ApiOrderGetData, MOrderGet> {
  ApiOrderGetDataMapper(
    this._apiMenuDataMapper,
  );

  final ApiMenuDataMapper _apiMenuDataMapper;

  @override
  MOrderGet mapToEntity(ApiOrderGetData? data) {
    return MOrderGet(
      tableId: data?.tableId ?? MOrderGet.defaultTableId,
      menuId: data?.menuId ?? MOrderGet.defaultMenuId,
      quantity: data?.quantity ?? MOrderGet.defaultQuantity,
      menu: _apiMenuDataMapper.mapToEntity(data?.menu),
    );
  }
}
