import 'package:dio/dio.dart';

import '../../../../../../data.dart';


class RestApiHeaderClient {
  RestApiHeaderClient({
    required this.dio,
    this.errorResponseMapperType = ApiClientDefaultSetting.defaultErrorResponseMapperType,
    this.successResponseMapperType = ApiClientDefaultSetting.defaultSuccessResponseMapperType,
  });

  final SuccessResponseMapperType successResponseMapperType;
  final ErrorResponseMapperType errorResponseMapperType;
  final Dio dio;

  Future<Headers?> requestHeadersOnly({
    required RestMethod method,
    required String path,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Options? options,
  }) async {
    try {
      final response = await _requestByMethod(
        method: method,
        path: path.startsWith(dio.options.baseUrl) ? path.substring(dio.options.baseUrl.length) : path,
        queryParameters: queryParameters,
        body: body,
        options: Options(
          headers: options?.headers,
          contentType: options?.contentType,
          responseType: options?.responseType,
          sendTimeout: options?.sendTimeout,
          receiveTimeout: options?.receiveTimeout,
        ),
      );

      // Trả về chỉ phần headers của response
      return response.headers;
    } catch (error) {
      throw DioExceptionMapper(
        BaseErrorResponseMapper.fromType(errorResponseMapperType),
      ).map(error);
    }
  }

  Future<Response<dynamic>> _requestByMethod({
    required RestMethod method,
    required String path,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Options? options,
  }) {
    switch (method) {
      case RestMethod.get:
        return dio.get(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.post:
        return dio.post(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.patch:
        return dio.patch(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.put:
        return dio.put(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.delete:
        return dio.delete(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
    }
  }
}
