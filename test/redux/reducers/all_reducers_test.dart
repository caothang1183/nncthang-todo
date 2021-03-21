import 'package:flutter_test/flutter_test.dart';

import 'app_reducer_test.dart' as app_reducer_test;
import 'auth_reducer_test.dart' as auth_reducer_test;
import 'task_reducer_test.dart' as task_reducer_test;

void main() {
  group('Test All Reducer on Todo App', () {
    app_reducer_test.main();
    auth_reducer_test.main();
    task_reducer_test.main();
  });
}
