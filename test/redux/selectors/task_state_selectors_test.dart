import 'package:flutter_test/flutter_test.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/redux/selectors/task_state_selectors.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';

import '../data_test/app_state_data_test.dart';

main() {
  AppState state = appStateDataTest;
  final _taskStateSelector = taskStateSelector(state);

  group('Task State Selector Test: should check if there are point to exactly state', () {
    test('Value from TaskStateSelector should return expected value', () {
      expect(_taskStateSelector.error, "");
      expect(_taskStateSelector.statusCode, 200);
      expect(_taskStateSelector.lastUpdated, DateTime.parse("2020-11-27T22:22:00.000Z"));
      expect(_taskStateSelector.isLoading, false);
      expect(_taskStateSelector.updating, false);
      expect(_taskStateSelector.taskResponse.tasks.length, 3);
    });

    test('Value from Task index = 0 on TaskState should return expected value', () {
      Task task1 = _taskStateSelector.taskResponse.tasks.first;
      expect(task1.id, "1");
      expect(task1.complete, true);
      expect(task1.deadline, "2021-03-21T13:00:00.000Z");
      expect(task1.task, "Test DateTimeUtils");
      expect(task1.note, "DateTimeUtils test functions");
    });

    test('Value from Task index = 1 on TaskState should return expected value', () {
      Task task2 = _taskStateSelector.taskResponse.tasks[1];
      expect(task2.id, "2");
      expect(task2.complete, true);
      expect(task2.deadline, "2021-03-21T14:00:00.000Z");
      expect(task2.task, "Test REDUX states");
      expect(task2.note, "Test REDUX states of Todo App");
    });

    test('Value from Task index = 2 on TaskState should return expected value', () {
      Task task3 = _taskStateSelector.taskResponse.tasks[2];
      expect(task3.id, "3");
      expect(task3.complete, false);
      expect(task3.deadline, "2021-03-21T15:30:00.000Z");
      expect(task3.task, "Test REDUX selectors");
      expect(task3.note, "Test REDUX selectors of Todo App");
    });
  });
}
