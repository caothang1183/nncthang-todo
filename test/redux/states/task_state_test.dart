import 'package:flutter_test/flutter_test.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';

import '../data_test/app_state_data_test.dart';

main() {
  final state = appStateDataTest;

  group('TaskState Test', () {
    test('Value from TaskState should return expected value', () {
      expect(state.taskState.error, "");
      expect(state.taskState.statusCode, 200);
      expect(state.taskState.lastUpdated, DateTime.parse("2020-11-27T22:22:00.000Z"));
      expect(state.taskState.isLoading, false);
      expect(state.taskState.updating, false);
      expect(state.taskState.taskResponse.tasks.length, 3);
    });

    test('Value from Task index = 0 on TaskState should return expected value', () {
      Task task1 = state.taskState.taskResponse.tasks.first;
      expect(task1.id, "1");
      expect(task1.complete, true);
      expect(task1.deadline, "2021-03-21T13:00:00.000Z");
      expect(task1.task, "Test DateTimeUtils");
      expect(task1.note, "DateTimeUtils test functions");
    });

    test('Value from Task index = 1 on TaskState should return expected value', () {
      Task task2 = state.taskState.taskResponse.tasks[1];
      expect(task2.id, "2");
      expect(task2.complete, true);
      expect(task2.deadline, "2021-03-21T14:00:00.000Z");
      expect(task2.task, "Test REDUX states");
      expect(task2.note, "Test REDUX states of Todo App");
    });

    test('Value from Task index = 2 on TaskState should return expected value', () {
      Task task3 = state.taskState.taskResponse.tasks[2];
      expect(task3.id, "3");
      expect(task3.complete, false);
      expect(task3.deadline, "2021-03-21T15:30:00.000Z");
      expect(task3.task, "Test REDUX selectors");
      expect(task3.note, "Test REDUX selectors of Todo App");
    });
  });
}
