import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/redux/actions/authentication_actions.dart';
import 'package:nncthang_todoapp/redux/actions/task_actions.dart';
import 'package:nncthang_todoapp/redux/states/task_state.dart';
import 'package:redux/redux.dart';

final taskReducer = combineReducers<TaskState>([
  TypedReducer<TaskState, LoadingTasksAction>(_loadingTasks),
  TypedReducer<TaskState, LoadTasksSuccessAction>(_loadTasksSuccess),
  TypedReducer<TaskState, LoadTasksFailureAction>(_loadTasksFailure),

  TypedReducer<TaskState, UpdateTaskStatusAction>(_updateTaskStatus),
  TypedReducer<TaskState, UpdatingTaskStatusAction>(_updatingTaskStatus),
  TypedReducer<TaskState, UpdateTaskStatusSuccessAction>(_updateTaskStatusSuccess),
  TypedReducer<TaskState, UpdateTaskStatusFailureAction>(_updateTaskStatusFailure),

  TypedReducer<TaskState, DeleteTaskSuccessAction>(_deleteTaskSuccess),
  TypedReducer<TaskState, DeleteTaskFailureAction>(_deleteTaskFailure),

  TypedReducer<TaskState, LogoutAccountAction>(_logout),
]);

TaskState _loadingTasks(TaskState state, LoadingTasksAction action) {
  return state.copyWith(isLoading: true);
}

TaskState _loadTasksSuccess(TaskState state, LoadTasksSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    taskResponse: action.taskResponse,
    lastUpdated: DateTime.now(),
  );
}

TaskState _loadTasksFailure(TaskState state, LoadTasksFailureAction action) {
  return state.copyWith(isLoading: false, error: action.error);
}

TaskState _updateTaskStatus(TaskState state, UpdateTaskStatusAction action) {

  return state.copyWith(

    statusCode: null,

  );
}

TaskState _updatingTaskStatus(TaskState state, UpdatingTaskStatusAction action) {
  return state.copyWith(
      updating: true,
  );
}

TaskState _updateTaskStatusSuccess(TaskState state, UpdateTaskStatusSuccessAction action) {
  var list = state.taskResponse.tasks;
  List<Task> updatedTasks = list.map((Task task) {
    if (task.id == action.taskUpdated.id) {
      return task.copyWith(complete: !task.complete);
    }
    return task;
  }).toList();

  return state.copyWith(
    taskResponse: state.taskResponse.copyWith(
      tasks: updatedTasks,
    ),
    statusCode: action.statusCode,
    lastUpdated: DateTime.now(),
    updating: false,
  );
}

TaskState _updateTaskStatusFailure(TaskState state, UpdateTaskStatusFailureAction action) {
  return state.copyWith(
    updating: false,
    isLoading: false,
    error: action.error,
  );
}

TaskState _deleteTaskSuccess(TaskState state, DeleteTaskSuccessAction action) {
  var list = state.taskResponse.tasks;
  List<Task> updatedTasks = [];
  list.forEach((Task task) {
    if (task.id != action.id) {
      updatedTasks.add(task);
    }
  });
  return state.copyWith(
    taskResponse: state.taskResponse.copyWith(
      tasks: updatedTasks,
    ),
  );
}

TaskState _deleteTaskFailure(TaskState state, DeleteTaskFailureAction action) {
  return state.copyWith(
    error: action.error,
  );
}

TaskState _logout(TaskState state, LogoutAccountAction action) {
  return TaskState();
}