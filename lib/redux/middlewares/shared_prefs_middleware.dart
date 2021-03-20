import 'package:nncthang_todoapp/data/shared_preferences_manager.dart';
import 'package:nncthang_todoapp/redux/actions/authentication_actions.dart';
import 'package:nncthang_todoapp/redux/actions/route_actions.dart';
import 'package:nncthang_todoapp/redux/actions/shared_prefs_action.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

final SharedPrefsManager _sharedPrefsManager = SharedPrefsManager();

List<Middleware<AppState>> sharedPrefsMiddleware() {
  return [
    TypedMiddleware<AppState, StoreLoginDataAction>(_storeLoginData()),
    TypedMiddleware<AppState, LoadLoginDataAction>(_loadLoginData()),
    TypedMiddleware<AppState, LogoutAccountAction>(_clearUserDriverProfile()),
  ];
}

Middleware<AppState> _storeLoginData() {
  return (Store<AppState> store, action, NextDispatcher next) {
    _sharedPrefsManager.setAccessToken(action.accessToken);
    _sharedPrefsManager.setLastLoginTime(DateTime.now().millisecondsSinceEpoch);
    next(action);
  };
}

Middleware<AppState> _loadLoginData() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    bool isOutOfDate = false;
    try {
      var now = DateTime.now();
      var loginTimeInMS = await _sharedPrefsManager.getLastLoginTime(); // will raise issue if did not have data
      print("[SharedPrefsManager] loginTimeInMS: $loginTimeInMS");
      var old = DateTime.fromMillisecondsSinceEpoch(loginTimeInMS);

      isOutOfDate = now.difference(old).inHours > 12;
      print("[SharedPrefsManager] isOutOfDate: $isOutOfDate");
    } catch (e) {
      print(e);
    }

    if (isOutOfDate) {
      // almost expire token: move to login
      store.dispatch(LogoutAccountAction());
    } else {
      // access token is still valid: move to home page with old data
      var data;
      try {
        data = await _sharedPrefsManager.getAccessToken();
      } catch (e) {
        print(e);
      }
      if (data != null && data.isNotEmpty) {
        store.dispatch(SignInAccountSuccessAction(accessToken: data));
        store.dispatch(OpenHomePageAction());
      }
    }
  };
}

Middleware<AppState> _clearUserDriverProfile() {
  return (Store<AppState> store, action, NextDispatcher next) {
    _sharedPrefsManager.clearAccessToken();
    _sharedPrefsManager.clearLastLoginTime();

    next(action);
  };
}
