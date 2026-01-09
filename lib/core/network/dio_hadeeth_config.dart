import 'package:dio/dio.dart';
import 'package:dua_zekr/core/const/api_ahadish_const.dart';

class DioHadeethConfig {
  late Dio dio;

  DioHadeethConfig._() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiAhadithConst.apiBaseUrl,
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('REQUEST[${options.method}] => PATH: ${options.path}');

          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
          print('RESPONSE[${response.data}]');
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          print('ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}');
          print('ERROR[${e.response?.data}]');
          return handler.next(e);
        },
      ),
    );
  }

  static final DioHadeethConfig instance = DioHadeethConfig._();
}
