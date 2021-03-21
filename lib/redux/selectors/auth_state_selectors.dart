import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:nncthang_todoapp/redux/states/auth_state.dart';


AuthState authStateSelector(AppState state) => state.authState;

bool signingInSelector(AppState state) => state.authState.signingIn;

String accessTokenSelector(AppState state) => state.authState.accessToken;

String loginErrorMessageSelector(AppState state) => state.authState.error;

DateTime lastSigningInSelector(AppState state) => state.authState.lastSigningIn;

