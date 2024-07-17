import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import '../../../../data.dart';

@LazySingleton()
class AppApiService {
  AppApiService(
    this._noneAuthAppServerApiClient,
    this._authAppServerApiClient,
  );
  final NoneAuthAppServerApiClient _noneAuthAppServerApiClient;
  final AuthAppServerApiClient _authAppServerApiClient;

  Future<DataResponse<ApiAuthResponseData>?> login({
    required String email,
    required String password,
  }) async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/login',
      body: {
        'email': email,
        'password': password,
      },
      decoder: (json) => ApiAuthResponseData.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<void> logout() async {
    await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/logout',
    );
  }

  Future<DataResponse<ApiAuthResponseData>?> register({
    required String username,
    required String email,
    required String password,
    required int gender,
  }) async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/register',
      body: {
        'username': username,
        'gender': gender,
        'email': email,
        'password': password,
        'password_confirmation': password,
      },
      decoder: (json) => ApiAuthResponseData.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<void> forgotPassword(String email) async {
    await _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/forgot-password',
      body: {
        'email': email,
      },
    );
  }

  Future<void> resetPassword({
    required String token,
    required String email,
    required String password,
  }) async {
    await _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/reset-password',
      body: {
        'token': token,
        'email': email,
        'password': password,
        'password_confirmation': password,
      },
    );
  }

  Future<ApiUserData?> getMe() async {
    return _authAppServerApiClient.request(
      method: RestMethod.get,
      path: '/v1/me',
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      decoder: (json) => ApiUserData.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<ApiListTableData?> getTables() async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.get,
      path: '${UrlConstants.appApiBaseUrl}/v1/tables/all',
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      decoder: (data) => ApiListTableData.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiCategoriesResponse?> getCategory() async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.get,
      path: '${UrlConstants.appApiBaseUrl}/v1/categories/all',
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      decoder: (data) => ApiCategoriesResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiListItemCategoriesData?> getItemMenu(String categories) async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.get,
      path: '${UrlConstants.appApiBaseUrl}/v1/menu/$categories',
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      decoder: (data) => ApiListItemCategoriesData.fromJson(data as Map<String, dynamic>),
    );
  }




  

  
}
