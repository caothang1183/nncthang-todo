import 'package:dio/dio.dart';
import 'package:nncthang_todoapp/network/interceptors/access_token_interceptor.dart';
import 'package:nncthang_todoapp/network/interceptors/network_log_interceptor.dart';
import 'package:redux/redux.dart';

const CONTENT_TYPE_KEY = "Content-Type";
const CONTENT_TYPE_VALUE = "application/json";

class DioManager {
  // ======= DIO configuration for Coach Intermediate server & Zonar server =======
  static Map<String, String> _header = {CONTENT_TYPE_KEY: CONTENT_TYPE_VALUE};
  static Dio _dio = Dio(BaseOptions(headers: _header, responseType: ResponseType.json));

  static Dio get dio => _dio;

  static Dio configureCoachInterceptor(Store store) {
    if (_dio.interceptors.isEmpty) {
      _dio.interceptors.add(AccessTokenInterceptor(dio: _dio, store: store));
      _dio.interceptors.add(NetworkLogInterceptor(store: store));
    }
    return _dio;
  }
}
