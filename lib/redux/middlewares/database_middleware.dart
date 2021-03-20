import 'package:nncthang_todoapp/data/models/tasks_data.dart';
import 'package:nncthang_todoapp/data/task_data_manager.dart';
import 'package:nncthang_todoapp/redux/actions/authentication_actions.dart';
import 'package:nncthang_todoapp/redux/actions/task_actions.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> databaseMiddleware() {
  return [
    TypedMiddleware<AppState, LoadTasksSuccessAction>(_storeTaskData()),
    TypedMiddleware<AppState, UpdateTaskStatusSuccessAction>(_updateTaskStatusData()),
    TypedMiddleware<AppState, DeleteTaskSuccessAction>(_deleteTaskData()),
    TypedMiddleware<AppState, AddTaskSuccessAction>(_addTaskData()),
    TypedMiddleware<AppState, EditTaskSuccessAction>(_editTaskData()),
    TypedMiddleware<AppState, LogoutAccountAction>(_logout()),
  ];
}

Middleware<AppState> _storeTaskData() {
  return (Store<AppState> store, action, NextDispatcher next) {
    storeTasksData(TasksData(taskResponse: action.taskResponse, updatedDate: DateTime.now()));
    next(action);
  };
}

Middleware<AppState> _addTaskData() {
  return (Store<AppState> store, action, NextDispatcher next) {
    Future.delayed(Duration(seconds: 5)).then((_) => addTaskData(action.task));
    next(action);
  };
}

Middleware<AppState> _editTaskData() {
  return (Store<AppState> store, action, NextDispatcher next) {
    updateTask(action.task);
    next(action);
  };
}

Middleware<AppState> _updateTaskStatusData() {
  return (Store<AppState> store, action, NextDispatcher next) {
    updateTaskStatus(action.taskUpdated);
    next(action);
  };
}

Middleware<AppState> _deleteTaskData() {
  return (Store<AppState> store, action, NextDispatcher next) {
    deleteTaskStatus(action.id);
    next(action);
  };
}

Middleware<AppState> _logout() {
  return (Store<AppState> store, action, NextDispatcher next) {
    clearTaskData();
    next(action);
  };
}

