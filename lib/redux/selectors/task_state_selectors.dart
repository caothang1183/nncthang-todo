import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:nncthang_todoapp/redux/states/task_state.dart';

List<Task> allTaskSelector(AppState state) {
  List<Task> list = state.taskState.taskResponse.tasks.toList();
  list.sort((a, b) => a.deadline.compareTo(b.deadline));
  return list;
}

List<Task> tasksCompleteSelector(AppState state) {
  List<Task> list = allTaskSelector(state).where((Task task) => task.complete == true).toList();
  list.sort((a, b) => a.deadline.compareTo(b.deadline));
  return list;
}

List<Task> tasksIncompleteSelector(AppState state) {
  List<Task> list = allTaskSelector(state).where((Task task) => task.complete == false).toList();
  list.sort((a, b) => a.deadline.compareTo(b.deadline));
  return list;
}

TaskState taskStateSelector(AppState state) => state.taskState;

bool isLoadingTaskSelector(AppState state) => state.taskState.isLoading;

bool updatingTaskSelector(AppState state) => state.taskState.updating;

String taskErrorMessageSelector(AppState state) => state.taskState.error;

DateTime taskLastUpdatedSelector(AppState state) => state.taskState.lastUpdated;

int statusCodeSelector(AppState state) => state.taskState.statusCode;
