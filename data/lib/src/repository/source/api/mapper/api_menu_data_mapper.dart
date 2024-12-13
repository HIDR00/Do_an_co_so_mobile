import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiMenuDataMapper extends BaseDataMapper<ApiMenuData, Menu> {
  @override
  Menu mapToEntity(ApiMenuData? data) {
    return Menu(
      id: data?.id ?? Menu.defaultId,
      createdAt: data?.createdAt ?? Menu.defaultCreatedAt,
      updatedAt: data?.updatedAt ?? Menu.defaultUpdatedAt,
      deletedAt: data?.deletedAt ?? Menu.defaultDeletedAt,
      name: data?.name ?? Menu.defaultName,
      price: data?.price ?? Menu.defaultPrice,
      imageUrl: data?.imageUrl ?? Menu.defaultImageUrl,
      categoriesId: data?.categoriesId ?? Menu.defaultCategoriesId,
      discription: data?.discription ?? Menu.defaultDiscription,
    );
  }
}
