import 'package:freezed_annotation/freezed_annotation.dart';


part 'api_login_data.freezed.dart';
part 'api_login_data.g.dart';

@freezed
class ApiLoginData with _$ApiLoginData {
  const factory ApiLoginData({
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'message') String? message,
  }) = _ApiLoginData;

  factory ApiLoginData.fromJson(Map<String, dynamic> json) =>
      _$ApiLoginDataFromJson(json);
}
