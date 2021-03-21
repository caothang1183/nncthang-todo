import 'package:flutter_test/flutter_test.dart';

import 'common/utils/datetime_utils_test.dart' as datetime_utils_test;
import './redux/middlewares/all_middlewares_test.dart' as all_middlewares_test;
import './redux/reducers/all_reducers_test.dart' as all_reducers_test;
import './redux/selectors/all_state_selectors_test.dart' as all_state_selectors_test;
import './redux/states/all_state_test.dart' as all_state_test;

void main() {
  group('Test UnitTest on Todo App', () {
    datetime_utils_test.main();
    all_middlewares_test.main();
    all_reducers_test.main();
    all_state_selectors_test.main();
    all_state_test.main();
  });
}
