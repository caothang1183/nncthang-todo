import 'package:nncthang_todoapp/redux/actions/app_actions.dart';
import 'package:nncthang_todoapp/redux/actions/authentication_actions.dart';
import 'package:nncthang_todoapp/redux/reducers/auth_reducer.dart';
import 'package:nncthang_todoapp/redux/reducers/task_reducer.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    activeBottomTabBar: bottomTabReducer(state, action).activeBottomTabBar,
    taskState: taskReducer(state.taskState, action),
    authState: authReducer(state.authState, action),
  );
}

final bottomTabReducer = combineReducers<AppState>([
  TypedReducer<AppState, SelectBottomTabBarAction>(_activeBottomTabBarReducer),
  TypedReducer<AppState, LogoutAccountAction>(_logout),
]);

AppState _activeBottomTabBarReducer(
  AppState state,
  SelectBottomTabBarAction action,
) {
  return state.copyWith(activeBottomTabBar: action.activeBottomTabBar);
}

AppState _logout(
    AppState state,
    LogoutAccountAction action,
    ) {
  return AppState();
}

