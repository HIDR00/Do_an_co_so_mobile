import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_device_data.freezed.dart';
part 'api_device_data.g.dart';

@freezed
class ApiDeviceData with _$ApiDeviceData {
  const ApiDeviceData._();

  factory ApiDeviceData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'device_token') String? deviceToken,
  }) = _ApiDeviceData;

  factory ApiDeviceData.fromJson(Map<String, dynamic> json) => _$ApiDeviceDataFromJson(json);
}
