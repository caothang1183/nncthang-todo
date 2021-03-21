import 'package:flutter_test/flutter_test.dart';

import 'auth_middleware_test.dart' as auth_middleware_test;
import 'task_middleware_test.dart' as task_middleware_test;

void main() {
  group('Test All Middleware on Todo App', () {
    auth_middleware_test.main();
    task_middleware_test.main();
  });
}
