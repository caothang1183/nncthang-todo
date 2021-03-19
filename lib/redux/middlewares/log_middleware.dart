import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> logMiddleware() {
  return [
    TypedMiddleware<AppState, Object>(logToPrint),
  ];
}

logToPrint(Store<AppState> store, action, NextDispatcher next) {
  print("[REDUX_ACTION]:" + action.toString());
  next(action);
}
