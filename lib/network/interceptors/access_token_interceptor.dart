
import 'package:dio/dio.dart';
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
    options.headers["access-token"] = "nncthang|eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjVmOWZlMDJlOGNjNGM2MTczM2NlZTRhZiIsInVzZXJuYW1lIjoibm5jdGhhbmciLCJlbWFpbCI6Im5uY3RoYW5nOTRAZ21haWwuY29tIiwiZnVsbG5hbWUiOiJOZ3V5ZW4gTmdvYyBDYW8gVGhhbmciLCJwYXNzd29yZCI6IiQyYSQxMCR0MkN0N1lrcWIvZWQ2NE9rZlpOSkMuNnE1RVlKb0dtQ1ZqL080Vkx2MGNnby9XVUhlci5SaSIsInJvbGUiOnsiX2lkIjoiNWUwMGRlMzVhMDdlY2ZhZWU0M2NiNGEwIiwiY3JlYXRlZF9kYXRlIjoiMjAxOS0xMi0yM1QxNTozMzowOS43MDVaIiwicm9sZV90eXBlIjoxLCJuYW1lIjoiQWRtaW4iLCJkZXNjcmlwdGlvbiI6ImZ1bGwgY29udHJvbCIsIl9fdiI6MH0sImNyZWF0ZWRfZGF0ZSI6IjIwMjAtMTEtMDJUMTA6MzI6MTQuOTg1WiIsIl9fdiI6MH0sImlhdCI6MTYxNjE4NDM3NiwiZXhwIjoxNjE2MjcwNzc2fQ.wI36BFatx5u4C3tmZwWN8AhN5goZYq-vICEovWIKQgw";
    return super.onRequest(options);
  }
}
