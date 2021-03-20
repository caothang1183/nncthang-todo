import 'package:nncthang_todoapp/common/emuns.dart';
import 'package:nncthang_todoapp/redux/states/task_state.dart';

class AppState {
  final TodoBottomTabBar activeBottomTabBar;
  final TaskState taskState;

  AppState({
    this.activeBottomTabBar = TodoBottomTabBar.all,
    this.taskState = const TaskState(),
  });

  AppState copyWith({
    TodoBottomTabBar activeBottomTabBar,
    TaskState taskState,
  }) {
    return AppState(
      activeBottomTabBar: activeBottomTabBar ?? this.activeBottomTabBar,
      taskState: taskState ?? this.taskState,
    );
  }
}
