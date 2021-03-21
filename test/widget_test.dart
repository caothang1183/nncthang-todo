import 'package:flutter_test/flutter_test.dart';
import './presentation/widgets/bottom_navigator_test.dart' as bottom_navigator_test;
import './presentation/widgets/complete_check_box_test.dart' as complete_check_box_test;
import './presentation/pages/home/fragments/widgets/task_item_test.dart' as task_item_test;
import './presentation/pages/home/fragments/widgets/task_list_test.dart' as task_list_test;
void main() {
  group("Common Widgets test", () {
    bottom_navigator_test.main();
    complete_check_box_test.main();
  });

  group("Home Widgets test", () {
    task_item_test.main();
    task_list_test.main();
  });
}
