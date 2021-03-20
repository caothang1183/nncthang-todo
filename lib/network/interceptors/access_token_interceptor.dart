
import 'package:dio/dio.dart';
import 'package:nncthang_todoapp/redux/selectors/authen_selectors.dart';
import 'package:redux/redux.dart';

///
/// Handle injecting access token & fleet id into header
///
class AccessTokenInterceptor extends InterceptorsWrapper {
  final Dio dio;
  final Store store;

  AccessTokenInterceptor({this.dio, this.store});

  @override
  Future onRequest(RequestOptions options) {
    options.headers["access-token"] = accessTokenSelector(store.state);
    return super.onRequest(options);
  }
}
