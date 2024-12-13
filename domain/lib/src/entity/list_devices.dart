import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'list_devices.freezed.dart';
  
@freezed
class ListDevice with _$ListDevice {
    const factory ListDevice({
        @Default(ListDevice.defaultData) List<Device> data,
    }) = _User;
  
    static const defaultData = <Device>[];
}  
