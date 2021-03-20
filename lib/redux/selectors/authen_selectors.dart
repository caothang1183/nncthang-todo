import 'package:nncthang_todoapp/redux/states/app_state.dart';


bool signingInSelector(AppState state) => state.authState.signingIn;

String accessTokenSelector(AppState state) => state.authState.accessToken;

String loginErrorMessageSelector(AppState state) => state.authState.error;

DateTime lastSigningInSelector(AppState state) => state.authState.lastSigningIn;

