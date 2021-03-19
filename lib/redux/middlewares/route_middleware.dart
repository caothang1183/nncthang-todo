import 'package:nncthang_todoapp/common/constants/routes.dart';
import 'package:nncthang_todoapp/main.dart';
import 'package:nncthang_todoapp/redux/actions/route_actions.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> routerMiddleware() {
  return [
    TypedMiddleware<AppState, OpenAddTaskPageAction>(openAddTaskPage),
  ];
}

openAddTaskPage(Store<AppState> store, action, NextDispatcher next) {
  navigatorKey.currentState.pushNamed(AppRoutes.addTaskRoute);
  next(action);
}