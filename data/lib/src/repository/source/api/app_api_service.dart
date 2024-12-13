import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import '../../../../data.dart';

@LazySingleton()
class AppApiService {
  AppApiService(
    this._noneAuthAppServerApiClient,
    this._authAppServerApiClient,
    this._headerApiClient
  );
  final NoneAuthAppServerApiClient _noneAuthAppServerApiClient;
  final AuthAppServerApiClient _authAppServerApiClient;
  final HeaderApiClient _headerApiClient;

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
      path: '${UrlConstants.appApiBaseUrl}/v1/tables',
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      decoder: (data) => ApiListTableData.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiListCategoriesData?> getCategory() async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.get,
      path: '${UrlConstants.appApiBaseUrl}/v1/categories',
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      decoder: (data) => ApiListCategoriesData.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiListMenuData?> getItemMenu() async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.get,
      path: '${UrlConstants.appApiBaseUrl}/v1/menus',
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      decoder: (data) => ApiListMenuData.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiPaymentData?> postPay(int tableId, bool isMomo) async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      decoder: (data) => ApiPaymentData.fromJson(data as Map<String, dynamic>),
      path: '${UrlConstants.appApiBaseUrl}/v1/payment/$tableId?isMoMo=$isMomo',
    );
  }

  Future<ApiUserResponseData?> postUser(String? email, String? password) async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      body: {'email': email, 'password': password},
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      decoder: (data) => ApiUserResponseData.fromJson(data as Map<String, dynamic>),
      path: '${UrlConstants.appApiBaseUrl}/v1/users/auth',
    );
  }

  Future<ApiTableOrderGetData?> getOderGuest(int tableId) async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.get,
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      decoder: (data) => ApiTableOrderGetData.fromJson(data as Map<String, dynamic>),
      path: '${UrlConstants.appApiBaseUrl}/v1/orders/$tableId',
    );
  }

  Future<ApiTableOrderData?> postTableOrder(int tableId, ApiTableOrderData tableOrderData) async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      body: tableOrderData.toJson(),
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      decoder: (data) => ApiTableOrderData.fromJson(data as Map<String, dynamic>),
      path: '${UrlConstants.appApiBaseUrl}/v1/orders/$tableId',
    );
  }

  Future<void> deleteUser(int tableId) async {
    await _noneAuthAppServerApiClient.request(
      method: RestMethod.delete,
      body: {'status': 0, 'pay_type': 0},
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      path: '${UrlConstants.appApiBaseUrl}/v1/orders/$tableId',
    );
  }

  Future<void> updateTableStatus(int tableId, int status) async {
    await _noneAuthAppServerApiClient.request(
      method: RestMethod.patch,
      body: {
        'status': status,
      },
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      path: '${UrlConstants.appApiBaseUrl}/v1/tables/$tableId',
    );
  }

  Future<ApiDeviceData?> postDeviceToken(String token) async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      body: {'device_token': token},
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      decoder: (data) => ApiDeviceData.fromJson(data as Map<String, dynamic>),
      path: '${UrlConstants.appApiBaseUrl}/v1/devices',
    );
  }

  Future<ApiListDevicesData?> getDevices() async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.get,
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      decoder: (data) => ApiListDevicesData.fromJson(data as Map<String, dynamic>),
      path: '${UrlConstants.appApiBaseUrl}/v1/devices',
    );
  }

  Future<void> postNoti(String token, int tableId) async {
    await _authAppServerApiClient.request(
      method: RestMethod.post,
      body: {
        'message': {
          'token': token,
          'notification': {'title': 'Bàn $tableId', 'body': 'Có order'}
        }
      },
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      path: UrlConstants.firebaseNotificationBaseUrl,
    );
  }

  Future<Headers?> postPayment(int amount) async {
    return _headerApiClient.requestHeadersOnly(
      method: RestMethod.post,
      body: FormData.fromMap({
        'ordertype': 'topup',
        'Amount': amount.toString(),
        'OrderDescription': 'Thanh toan don hang thoi gian: 2024-10-17 23:53:13',
        'bankcode': 'QRONLY',
        'language': 'vn',
        '__RequestVerificationToken':
            'ICxLiKMJcbaZ7Bl-Rzybivq8kLwfuNqE5MZS2-B-BxpXKrG4TzkwfK3FZTeyq5fDkZAFhRGS0LcPsjJt4CtU-2HBfgRg9pYz5a3CmsIxaQs1'
      }),
      path: '',
    );
  }

  Future<void> postEmployeeHandleOrder(ApiEmployeeHandleOrderData employeeHandleOrder) async {
    await _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      body: {
        'total_price': employeeHandleOrder.totalPrice,
        'table_id': employeeHandleOrder.tableId,
        'table_status': employeeHandleOrder.tableStatus,
        'user_id': employeeHandleOrder.userId
      },
      path: '/v1/employee_handle_order',
    );
  }
}
