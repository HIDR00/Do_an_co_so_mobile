import 'package:freezed_annotation/freezed_annotation.dart';


part 'api_user_data.freezed.dart';
part 'api_user_data.g.dart';

@freezed
class ApiUserData with _$ApiUserData {
  const ApiUserData._();

  const factory ApiUserData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'password') String? password,
    @JsonKey(name: 'role_type') int? roleType,
  }) = _ApiUserData;

  factory ApiUserData.fromJson(Map<String, dynamic> json) => _$ApiUserDataFromJson(json);
}
