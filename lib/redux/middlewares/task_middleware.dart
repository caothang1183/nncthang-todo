import 'package:dio/dio.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/common/entities/task_response.dart';
import 'package:nncthang_todoapp/common/utils/datetime_utils.dart';
import 'package:nncthang_todoapp/data/models/tasks_data.dart';
import 'package:nncthang_todoapp/data/task_data_manager.dart';
import 'package:nncthang_todoapp/network/api_provider.dart';
import 'package:nncthang_todoapp/network/models/task_criteria.dart';
import 'package:nncthang_todoapp/network/task_repository.dart';
import 'package:nncthang_todoapp/redux/actions/authentication_actions.dart';
import 'package:nncthang_todoapp/redux/actions/route_actions.dart';
import 'package:nncthang_todoapp/redux/actions/task_actions.dart';
import 'package:nncthang_todoapp/redux/selectors/task_state_selectors.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> taskMiddleware([
  TaskRepository repository = const TaskRepository(const ApiProvider()),
]) {
  return [
    TypedMiddleware<AppState, LoadTasksAction>(_loadTasks(repository)),
    TypedMiddleware<AppState, UpdateTaskStatusAction>(_updateTaskStatus(repository)),
    TypedMiddleware<AppState, DeleteTaskAction>(_deleteTask(repository)),
    TypedMiddleware<AppState, AddTaskAction>(_addTask(repository)),
    TypedMiddleware<AppState, EditTaskAction>(_editTask(repository)),
    TypedMiddleware<AppState, LogoutAccountAction>(_logout()),
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

Middleware<AppState> _addTask(TaskRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    store.dispatch(AddingTaskAction());
    TaskCriteria criteria = TaskCriteria(
      task: action.task.task,
      note: action.task.note,
      deadline: action.task.deadline,
      complete: action.task.complete,
    );
    repository.addTask<Response>(criteria).then((response) {
      if(response.statusCode == 200){
        Task taskAdded = Task.fromJson(response.data['data']);
        store.dispatch(AddTaskSuccessAction(task: taskAdded));
        store.dispatch(PopPageAction());
      } else {
        store.dispatch(AddTaskFailureAction(error: "Something went wrong!"));
      }
    }).catchError((e) =>store.dispatch(AddTaskFailureAction(error: e.toString())));

    next(action);
  };
}

Middleware<AppState> _editTask(TaskRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    store.dispatch(EditingTaskAction());
    TaskCriteria criteria = TaskCriteria(
      id: action.task.id,
      task: action.task.task,
      note: action.task.note,
      deadline: action.task.deadline,
      complete: action.task.complete,
    );
    repository.updateTask<Response>(criteria).then((response) {
      if(response.statusCode == 200) {
        Task taskUpdated = Task.fromJson(response.data['data']);
        store.dispatch(EditTaskSuccessAction(task: taskUpdated));
        store.dispatch(PopPageAction());
      } else{
        store.dispatch(EditTaskFailureAction(error: "Something went wrong!"));
      }

    }).catchError((e) => store.dispatch(EditTaskFailureAction(error: e.toString())));

    next(action);
  };
}

Middleware<AppState> _updateTaskStatus(TaskRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    store.dispatch(UpdatingTaskStatusAction());
    repository.updateTaskStatus<Response>(action.taskId).then((response) {
      Task taskUpdated = Task.fromJson(response.data['data']);
      store.dispatch(UpdateTaskStatusSuccessAction(taskUpdated: taskUpdated));
    }).catchError((e) => store.dispatch(UpdateTaskStatusFailureAction(error: e.toString())));

    next(action);
  };
}

Middleware<AppState> _deleteTask(TaskRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.deleteTask<Response>(action.taskId).then((response) {
      if(response.statusCode == 200){
        store.dispatch(DeleteTaskSuccessAction(id: action.taskId));
      } else {
        store.dispatch(DeleteTaskFailureAction(error: "Something went wrong!"));
      }
    }).catchError((e) => store.dispatch(DeleteTaskFailureAction(error: e.toString())));

    next(action);
  };
}

Middleware<AppState> _logout() {
  return (Store<AppState> store, action, NextDispatcher next) {
    Future.delayed(Duration(milliseconds: 300)).then((value) => store.dispatch(OpenLoginPageAction()));
    next(action);
  };
}
