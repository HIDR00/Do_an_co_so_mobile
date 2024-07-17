import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiCategoriesDataMapper extends BaseDataMapper<ApiCategoriesData, MCategories> {
  @override
  MCategories mapToEntity(ApiCategoriesData? data) {
    return MCategories(
      id: data?.id ?? -1,
      name: data?.categoryName ?? '',
    );
  }
  MListCategories mapToEntityList(ApiListCategoriesData? dataList) {
    return MListCategories(
      lMCategories: dataList?.categories?.map((data) => mapToEntity(data)).toList() ?? []
    );
  }
}
