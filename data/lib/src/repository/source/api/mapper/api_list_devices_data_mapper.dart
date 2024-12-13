import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiListDevicesDataMapper extends BaseDataMapper<ApiListDevicesData, ListDevice> {
  ApiListDevicesDataMapper(
    this._apiDeviceDataMapper,
  );

  final ApiDeviceDataMapper _apiDeviceDataMapper;
  @override
  ListDevice mapToEntity(ApiListDevicesData? data) {
    return ListDevice(
      data: _apiDeviceDataMapper.mapToListEntity(data?.data),
    );
  }
}
