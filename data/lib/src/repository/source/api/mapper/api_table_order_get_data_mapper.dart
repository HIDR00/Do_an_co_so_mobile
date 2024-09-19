import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiTableOrderGetDataMapper extends BaseDataMapper<ApiTableOrderGetData, TableOrderGet> {
    ApiTableOrderGetDataMapper(
    this._apiOrderGetDataMapper,
  );

  final ApiOrderGetDataMapper _apiOrderGetDataMapper;

  @override
  TableOrderGet mapToEntity(ApiTableOrderGetData? data) {
    return TableOrderGet(
      id: data?.id ?? TableOrderGet.defaultId,
      status: data?.status ?? TableOrderGet.defaultStatus,
      payType: data?.payType ?? TableOrderGet.defaultPayType,
      orders: _apiOrderGetDataMapper.mapToListEntity(data?.orders),
    );
  }
}
