import 'package:nncthang_todoapp/redux/actions/app_actions.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    activeBottomTabBar: bottomTabReducer(state, action).activeBottomTabBar,
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
