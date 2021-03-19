import 'package:nncthang_todoapp/common/emuns.dart';

class AppState {
  final TodoBottomTabBar activeBottomTabBar;

  AppState({
    this.activeBottomTabBar = TodoBottomTabBar.all,
  });

  AppState copyWith({
    TodoBottomTabBar activeBottomTabBar,
  }) {
    return AppState(activeBottomTabBar: activeBottomTabBar ?? this.activeBottomTabBar);
  }
}
