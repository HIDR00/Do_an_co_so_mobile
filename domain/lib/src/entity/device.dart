import 'package:freezed_annotation/freezed_annotation.dart';

part 'device.freezed.dart';

@freezed
class Device with _$Device {
  const factory Device({
    @Default(Device.defaultId) int id,
    @Default(Device.defaultCreatedAt) String createdAt,
    @Default(Device.defaultUpdatedAt) String updatedAt,
    @Default(Device.defaultDeletedAt) String deletedAt,
    @Default(Device.defaultDeviceToken) String deviceToken,
  }) = _User;

  static const defaultId = 0;
  static const defaultCreatedAt = '';
  static const defaultUpdatedAt = '';
  static const defaultDeletedAt = '';
  static const defaultDeviceToken = '';
}
