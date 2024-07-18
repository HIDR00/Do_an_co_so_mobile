import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiOderItemDataMapper extends BaseDataMapper<ApiOderItemData, MOrderItem> with DataMapperMixin {
  @override
  ApiOderItemData mapToData(MOrderItem entity) {
    return ApiOderItemData(
      itemId: entity.itemId,
      quantity: entity.quantity
    );
  }
  
  @override
  MOrderItem mapToEntity(ApiOderItemData? data) {
    throw UnimplementedError();
  }
}
