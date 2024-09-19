import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
  
import '../../../../../data.dart';
  
@Injectable()
class ApiListCategoriesDataMapper extends BaseDataMapper<ApiListCategoriesData, ListCategories> {

    ApiListCategoriesDataMapper(
    this._apiCategoriesDataMapper,
  );

  final ApiCategoriesDataMapper _apiCategoriesDataMapper;
    @override
    ListCategories mapToEntity(ApiListCategoriesData? data) {
      return ListCategories(
        data: _apiCategoriesDataMapper.mapToListEntity(data?.data),
      );
    }
}  
