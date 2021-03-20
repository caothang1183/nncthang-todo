import 'package:nncthang_todoapp/network/api_provider.dart';
import 'package:nncthang_todoapp/network/auth_repository.dart';
import 'package:nncthang_todoapp/network/models/auth_criteria.dart';
import 'package:nncthang_todoapp/redux/actions/authentication_actions.dart';
import 'package:nncthang_todoapp/redux/actions/route_actions.dart';
import 'package:nncthang_todoapp/redux/actions/shared_prefs_action.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> authMiddleware([
  AuthRepository repository = const AuthRepository(const ApiProvider()),
]) {
  return [
    TypedMiddleware<AppState, SignInAccountAction>(_signIn(repository)),
  ];
}

Middleware<AppState> _signIn(AuthRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    store.dispatch(SigningInAccountAction());
    var criteria = AuthCriteria(
      username: action.username,
      password: action.password,
    );
    repository.signIn<String>(criteria).then((response) {
      store.dispatch(SignInAccountSuccessAction(accessToken: response));
      store.dispatch(StoreLoginDataAction(accessToken: response));
      store.dispatch(OpenHomePageAction());
    }).catchError((e) => store.dispatch(SignInAccountFailureAction(error: e.toString())));
    next(action);
  };
}
