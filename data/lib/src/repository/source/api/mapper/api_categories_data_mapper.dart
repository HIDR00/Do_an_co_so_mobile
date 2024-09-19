import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiCategoriesDataMapper extends BaseDataMapper<ApiCategoriesData, Categories> {
  @override
  Categories mapToEntity(ApiCategoriesData? data) {
    return Categories(
      id: data?.id ?? Categories.defaultId,
      createdAt: data?.createdAt ?? Categories.defaultCreatedAt,
      updatedAt: data?.updatedAt ?? Categories.defaultUpdatedAt,
      deletedAt: data?.deletedAt ?? Categories.defaultDeletedAt,
      name: data?.name ?? Categories.defaultName,
    );
  }
}
