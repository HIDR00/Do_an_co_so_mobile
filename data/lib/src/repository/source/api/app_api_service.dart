import 'dart:convert';

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

  Future<void> postListOrder(List<ApiOderItemData> lOrderItem,int tableId) async {
    await _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      body: jsonEncode(lOrderItem.map((item) => item.toJson()).toList()),
      path: '${UrlConstants.appApiBaseUrl}/v1/orders?tableId=$tableId',
    );
  }

  Future<void> postNoti(String title, String body) async {
    await _noneAuthAppServerApiClient.request(
      method: RestMethod.post, 
      body: {
        'title': title,
        'body': body,
        'image': 'https://posapp.vn/wp-content/uploads/2020/09/%C4%91%E1%BB%93ng-b%E1%BB%99-n%E1%BB%99i-th%E1%BA%A5t.jpg'
      },
      path: '${UrlConstants.appApiBaseUrl}/v1/notifications/send',
    );
  }

   Future<ApiPaymentData?> postPay(int tableId,bool isMomo) async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      decoder: (data) => ApiPaymentData.fromJson(data as Map<String, dynamic>),
      path: '${UrlConstants.appApiBaseUrl}/v1/payment/$tableId?isMoMo=$isMomo',
    );
  }

  Future<ApiLoginData?> postUser(String? email,String? password) async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      body: {
        'username': email,
        'password': password
      },
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      decoder: (data) => ApiLoginData.fromJson(data as Map<String, dynamic>),
      path: '${UrlConstants.appApiBaseUrl}/v1/users/login?isAdmin=false',
    );
  }
  
  Future<ApiListOderItemGuestData?> getOderGuest(int tableId) async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.get,
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      decoder: (data) {
      final Map<String, dynamic> dataMap = data as Map<String, dynamic>;
      return ApiListOderItemGuestData.fromJson(dataMap['data'] as Map<String, dynamic>);
    },
      path: '${UrlConstants.appApiBaseUrl}/v1/orders/getOrderDetails?tableId=$tableId',
    );
  }

  Future<void> postFreeTable(int tableId) async {
    await _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      path: '${UrlConstants.appApiBaseUrl}/v1/tables/update?tableId=$tableId&isFree=true',
    );
  }

  Future<void> postDeviceToken(String token) async {
    await _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      path: '${UrlConstants.appApiBaseUrl}/v1/device-tokens?token=$token',
    );
  }
}
