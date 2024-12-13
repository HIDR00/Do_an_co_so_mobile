import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:shared/shared.dart';
import '../../../../../data.dart';

@LazySingleton()
class HeaderApiClient extends RestApiHeaderClient {
  HeaderApiClient()
      : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(
              baseUrl: UrlConstants.paymentBaseUrl,
              followRedirects: true,
              maxRedirects: 5,
              validateStatus: (status) {
                return status != null && status >= 200 && status < 400; // Không ném lỗi cho 302
              },
            ),
          ),
        );
}
