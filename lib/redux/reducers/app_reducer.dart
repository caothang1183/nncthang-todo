import 'package:nncthang_todoapp/redux/actions/app_actions.dart';
import 'package:nncthang_todoapp/redux/reducers/task_reducer.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    activeBottomTabBar: bottomTabReducer(state, action).activeBottomTabBar,
    taskState: taskReducer(state.taskState, action),
  );
}

final bottomTabReducer = combineReducers<AppState>([
  TypedReducer<AppState, SelectBottomTabBarAction>(_activeBottomTabBarReducer),
]);

AppState _activeBottomTabBarReducer(
  AppState state,
  SelectBottomTabBarAction action,
) {
  return state.copyWith(activeBottomTabBar: action.activeBottomTabBar);
}
