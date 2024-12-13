import 'package:freezed_annotation/freezed_annotation.dart';


part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    @Default(User.defaultId) int id,
    @Default(User.defaultEmail) String email,
    @Default(User.defaultPassword) String password,
    @Default(User.defaultName) String name,
    @Default(User.defaultRoleType) int roleType,
  }) = _User;

  static const defaultId = -1;
  static const defaultEmail = '';
  static const defaultPassword = '';
  static const defaultName = '';
  static const defaultRoleType = -1;
}
