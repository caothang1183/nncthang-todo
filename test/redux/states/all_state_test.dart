import 'package:flutter_test/flutter_test.dart';

import 'app_state_test.dart' as app_state_test;
import 'auth_state_test.dart' as auth_state_test;
import 'task_state_test.dart' as task_state_test;

void main() {
  group('Test All State on Todo App', () {
    app_state_test.main();
    auth_state_test.main();
    task_state_test.main();
  });
}
