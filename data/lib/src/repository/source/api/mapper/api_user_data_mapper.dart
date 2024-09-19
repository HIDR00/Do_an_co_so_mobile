import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import '../../../../../data.dart';

@Injectable()
class ApiUserDataMapper extends BaseDataMapper<ApiUserData, User> {
  ApiUserDataMapper(
    this._genderDataMapper,
    this._apiImageUrlDataMapper,
  );

  final GenderDataMapper _genderDataMapper;
  final ApiImageUrlDataMapper _apiImageUrlDataMapper;

  @override
  User mapToEntity(ApiUserData? data) {
    return User(
      id: data?.id ?? User.defaultId,
      email: data?.email ?? User.defaultEmail,
      password: data?.password ?? User.defaultPassword,
      name: data?.email ?? User.defaultEmail,
      roleType: data?.roleType ?? User.defaultRoleType,
    );
  }
}
