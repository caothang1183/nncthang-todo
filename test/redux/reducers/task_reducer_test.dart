import 'package:flutter_test/flutter_test.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/common/entities/task_response.dart';
import 'package:nncthang_todoapp/redux/actions/task_actions.dart';

import '../data_test/store_data_test.dart';

main() {
  var store = storeDataTest;

  group('Task Reducer Test', () {
    test('should return isLoading = true on LoadingTasksAction', () {
      store.dispatch(LoadingTasksAction());
      expect(store.state.taskState.isLoading, true);
    });

    test('should return isLoading = false, lastUpdated = DateTime.now() on LoadTasksSuccessAction', () {
      var taskResponse = TaskResponse(
        tasks: [
          Task(
            id: "1",
            task: "Test DateTimeUtils",
            deadline: "2021-03-21T13:00:00.000Z",
            complete: true,
            note: "DateTimeUtils test functions",
            createdDate: "2021-03-21T12:00:00.000Z",
          ),
          Task(
            id: "2",
            task: "Test REDUX states",
            deadline: "2021-03-21T14:00:00.000Z",
            complete: true,
            note: "Test REDUX states of Todo App",
            createdDate: "2021-03-21T13:00:00.000Z",
          ),
          Task(
            id: "3",
            task: "Test REDUX selectors",
            deadline: "2021-03-21T15:30:00.000Z",
            complete: false,
            note: "Test REDUX selectors of Todo App",
            createdDate: "2021-03-21T15:00:00.000Z",
          ),
        ],
      );
      store.dispatch(LoadTasksSuccessAction(taskResponse: taskResponse));
      expect(store.state.taskState.isLoading, false);
      expect(store.state.taskState.taskResponse.tasks.length, 3);
    });

    test('should return isLoading = false, error != "" on LoadTasksFailureAction', () {
      store.dispatch(LoadTasksFailureAction(error: "error message"));
      expect(store.state.taskState.isLoading, false);
      expect(store.state.taskState.error, "error message");
    });

    test('should return updating = true on UpdatingTaskStatusAction', () {
      store.dispatch(UpdatingTaskStatusAction());
      expect(store.state.taskState.updating, true);
    });

    test('should return updating = false, statusCode = 200, taskUpdated = newTask on UpdateTaskStatusSuccessAction', () {
      Task task = store.state.taskState.taskResponse.tasks.where((task) => task.id == "1").first;
      expect(task.complete, true);
      store.dispatch(UpdateTaskStatusSuccessAction(taskUpdated: task));

      Task taskUpdated = store.state.taskState.taskResponse.tasks.where((task) => task.id == "1").first;
      expect(taskUpdated.complete, false);
    });

    test('should return updating = false, error != "" on UpdateTaskStatusFailureAction', () {
      store.dispatch(UpdateTaskStatusFailureAction(error: "error message"));
      expect(store.state.taskState.updating, false);
      expect(store.state.taskState.error, "error message");
    });

    test('should return updating = true on EditingTaskAction', () {
      store.dispatch(EditingTaskAction());
      expect(store.state.taskState.updating, true);
    });

    test('should return updating = false, taskUpdated = newTask on EditTaskSuccessAction', () {
      Task task = Task(
        id: "1",
        task: "New Task",
        note: "New Task note",
        complete: false,
      );
      store.dispatch(EditTaskSuccessAction(task: task,));

      Task taskUpdated = store.state.taskState.taskResponse.tasks.where((task) => task.id == "1").first;
      expect(taskUpdated.complete, false);
      expect(taskUpdated.task, "New Task");
      expect(taskUpdated.note, "New Task note");
    });

    test('should return updating = false, error != "" on EditTaskFailureAction', () {
      store.dispatch(EditTaskFailureAction(error: "error message"));
      expect(store.state.taskState.updating, false);
      expect(store.state.taskState.error, "error message");
    });

    test('should return updating = false, remove task on DeleteTaskSuccessAction', () {
      List<Task> tasks = store.state.taskState.taskResponse.tasks.where((task) => task.id == "1").toList();
      expect(tasks.length, 1);
      store.dispatch(DeleteTaskSuccessAction(id: "1"));

      List<Task> tasksUpdated = store.state.taskState.taskResponse.tasks.where((task) => task.id == "1").toList();
      expect(tasksUpdated.length, 0);
    });

    test('should return updating = false, error != "" on DeleteTaskFailureAction', () {
      store.dispatch(DeleteTaskFailureAction(error: "error message"));
      expect(store.state.taskState.updating, false);
      expect(store.state.taskState.error, "error message");
    });

  });
}
