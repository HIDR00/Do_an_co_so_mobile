import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiListMenuDataMapper extends BaseDataMapper<ApiListMenuData, ListMenu> {
  ApiListMenuDataMapper(
    this._apiMenuDataMapper,
  );

  final ApiMenuDataMapper _apiMenuDataMapper;

  @override
  ListMenu mapToEntity(ApiListMenuData? data) {
    return ListMenu(
      data: _apiMenuDataMapper.mapToListEntity(data?.data),
    );
  }
}
