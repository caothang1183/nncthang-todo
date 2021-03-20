import 'package:dio/dio.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/common/entities/task_response.dart';
import 'package:nncthang_todoapp/common/utils/datetime_utils.dart';
import 'package:nncthang_todoapp/data/models/tasks_data.dart';
import 'package:nncthang_todoapp/data/task_data_manager.dart';
import 'package:nncthang_todoapp/network/api_provider.dart';
import 'package:nncthang_todoapp/network/task_repository.dart';
import 'package:nncthang_todoapp/redux/actions/task_actions.dart';
import 'package:nncthang_todoapp/redux/selectors/task_selectors.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> taskMiddleware([
  TaskRepository repository = const TaskRepository(const ApiProvider()),
]) {
  return [
    TypedMiddleware<AppState, LoadTasksAction>(_loadTasks(repository)),
    TypedMiddleware<AppState, UpdateTaskStatusAction>(_updateTaskStatus(repository)),
  ];
}

Middleware<AppState> _loadTasks(TaskRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    DateTime lastUpdated = taskLastUpdatedSelector(store.state);
    TasksData data = getNewestTaskData();
    bool validCallApi = lastUpdated == null || data != null || DateTimeUtils.isExpiredCachingTime(lastUpdated);
    if (validCallApi) {
      store.dispatch(LoadingTasksAction());
      repository.loadTasks<TaskResponse>().then((taskResponse) {
        store.dispatch(LoadTasksSuccessAction(taskResponse: taskResponse));
      }).catchError((e) => store.dispatch(LoadTasksFailureAction(error: e.toString())));
    } else {
      store.dispatch(LoadTasksSuccessAction(taskResponse: data.taskResponse));
    }

    next(action);
  };
}

Middleware<AppState> _updateTaskStatus(TaskRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    store.dispatch(UpdatingTaskStatusAction());
    repository.updateTaskStatus<Response>(action.taskId).then((response) {
      Task taskUpdated = Task.fromJson(response.data['data']);
      int statusCode = response.statusCode;
      store.dispatch(UpdateTaskStatusSuccessAction(taskUpdated: taskUpdated, statusCode: statusCode));
    }).catchError((e) => store.dispatch(UpdateTaskStatusFailureAction(
          error: e.toString())));

    next(action);
  };
}
