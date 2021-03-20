import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';

List<Task> allTaskSelector(AppState state) {
  List<Task> list = state.taskState.taskResponse.tasks.toList();
  list.sort((a, b) => a.createdDate.compareTo(b.createdDate));
  return list;
}

List<Task> tasksCompleteSelector(AppState state) {
  List<Task> list = allTaskSelector(state).where((Task task) => task.complete == true).toList();
  list.sort((a, b) => a.createdDate.compareTo(b.createdDate));
  return list;
}

List<Task> tasksIncompleteSelector(AppState state) {
  List<Task> list = allTaskSelector(state).where((Task task) => task.complete == false).toList();
  list.sort((a, b) => a.createdDate.compareTo(b.createdDate));
  return list;
}

bool isLoadingTaskSelector(AppState state) => state.taskState.isLoading;

bool updatingTaskSelector(AppState state) => state.taskState.updating;

String taskErrorMessageSelector(AppState state) => state.taskState.error;

DateTime taskLastUpdatedSelector(AppState state) => state.taskState.lastUpdated;

int statusCodeSelector(AppState state) => state.taskState.statusCode;

