import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class LocalUserDataMapper extends BaseDataMapper<LocalUserData, User> with DataMapperMixin {

  @override
  User mapToEntity(LocalUserData? data) {
    return User(
      id: data?.id ?? User.defaultId,
      email: data?.email ?? User.defaultEmail,
      password: data?.password ?? User.defaultPassword,
      name: data?.name ?? User.defaultName,
      roleType: data?.roleType ?? User.defaultRoleType,
    );
  }

  @override
  LocalUserData mapToData(User entity) {
    return LocalUserData(
      id: entity.id,
      email: entity.email,
      password: entity.password,
      name: entity.name,
      roleType: entity.roleType,
    );
  }
}
