import 'package:nncthang_todoapp/common/emuns.dart';
import 'package:nncthang_todoapp/redux/states/auth_state.dart';
import 'package:nncthang_todoapp/redux/states/task_state.dart';

class AppState {
  final TodoBottomTabBar activeBottomTabBar;
  final TaskState taskState;
  final AuthState authState;

  AppState({
    this.activeBottomTabBar = TodoBottomTabBar.all,
    this.taskState = const TaskState(),
    this.authState = const AuthState(),
  });

  AppState copyWith({
    TodoBottomTabBar activeBottomTabBar,
    TaskState taskState,
    AuthState authState,
  }) {
    return AppState(
      activeBottomTabBar: activeBottomTabBar ?? this.activeBottomTabBar,
      taskState: taskState ?? this.taskState,
      authState: authState ?? this.authState,
    );
  }
}
