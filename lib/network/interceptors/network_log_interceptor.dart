import 'package:dio/dio.dart';
import 'package:redux/redux.dart';

///
/// Handle API logger
///
class NetworkLogInterceptor extends InterceptorsWrapper {
  Store store;

  NetworkLogInterceptor({this.store});

  @override
  Future onRequest(RequestOptions options) {
    print('NetworkLogInterceptor onRequest===: ${options.uri.toString()} === data: ${options.data.toString()}');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print('NetworkLogInterceptor onResponse===: ${response.toString()} === of ${response.request.uri}');
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print('NetworkLogInterceptor onError===: ${err.message} === response: ${err.response.toString()} === of ${err.response.request.uri}');
    return super.onError(err);
  }
}
