import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiItemCategoriesDataMapper extends BaseDataMapper<ApiItemCategoriesData, MItemCategories> {
  @override
  MItemCategories mapToEntity(ApiItemCategoriesData? data) {
    return MItemCategories(
      id: data?.id ?? -1,
      name: data?.name ?? '',
      price: data?.price ?? -1,
      image: data?.image ?? '',
      categoryName: data?.categoryName ?? ''
    );
  }


  MItemCategoriesResponseList mapToEntityList(ApiItemCategoriesResponseListData? dataList) {
    return MItemCategoriesResponseList(
      lMItemCategories: dataList?.lItemCategories?.map((data) => mapToEntity(data)).toList() ?? []
    );
  }
}
