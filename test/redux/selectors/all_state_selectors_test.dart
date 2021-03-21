import 'package:flutter_test/flutter_test.dart';

import 'app_state_selectors_test.dart' as app_state_selectors_test;
import 'auth_state_selectors_test.dart' as auth_selectors_test;
import 'task_state_selectors_test.dart' as task_state_selectors_test;

void main() {
  group('Test All Selectors on Todo App', () {
    app_state_selectors_test.main();
    auth_selectors_test.main();
    task_state_selectors_test.main();
  });
}
