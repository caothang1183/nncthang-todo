import 'package:nncthang_todoapp/redux/actions/authentication_actions.dart';
import 'package:nncthang_todoapp/redux/states/auth_state.dart';
import 'package:redux/redux.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, SigningInAccountAction>(_signingInAccount),
  TypedReducer<AuthState, SignInAccountSuccessAction>(_signingInSuccessAccount),
  TypedReducer<AuthState, SignInAccountFailureAction>(_signingInFailureAccount),
  TypedReducer<AuthState, LogoutAccountAction>(_logout),
]);

AuthState _signingInAccount(AuthState state, SigningInAccountAction action) {
  return state.copyWith(signingIn: true);
}

AuthState _signingInSuccessAccount(AuthState state, SignInAccountSuccessAction action) {
  return state.copyWith(
    signingIn: false,
    accessToken: action.accessToken,
    lastSigningIn: DateTime.now(),
    error: "",
  );
}

AuthState _signingInFailureAccount(AuthState state, SignInAccountFailureAction action) {
  return state.copyWith(signingIn: false, error: action.error, accessToken: "");
}

AuthState _logout(AuthState state, LogoutAccountAction action) {
  return AuthState();
}
