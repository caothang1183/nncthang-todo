import 'package:nncthang_todoapp/common/emuns.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/common/entities/task_response.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:nncthang_todoapp/redux/states/auth_state.dart';
import 'package:nncthang_todoapp/redux/states/task_state.dart';

final AppState appStateDataTest = AppState(
  authState: AuthState(
    accessToken: "token",
    signingIn: false,
    error: "",
    lastSigningIn: DateTime.parse("2020-11-27T22:22:00.000Z"),
  ),
  taskState: TaskState(
    lastUpdated: DateTime.parse("2020-11-27T22:22:00.000Z"),
    updating: false,
    isLoading: false,
    error: "",
    statusCode: 200,
    taskResponse: TaskResponse(tasks: [
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
    ]),
  ),
  activeBottomTabBar: TodoBottomTabBar.all,
);
