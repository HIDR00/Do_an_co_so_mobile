import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiDeviceDataMapper extends BaseDataMapper<ApiDeviceData, Device> {
  @override
  Device mapToEntity(ApiDeviceData? data) {
    return Device(
      id: data?.id ?? Device.defaultId,
      createdAt: data?.createdAt ?? Device.defaultCreatedAt,
      updatedAt: data?.updatedAt ?? Device.defaultUpdatedAt,
      deletedAt: data?.deletedAt ?? Device.defaultDeletedAt,
      deviceToken: data?.deviceToken ?? Device.defaultDeviceToken,
    );
  }
}
