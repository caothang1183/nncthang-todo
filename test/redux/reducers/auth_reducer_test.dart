import 'package:flutter_test/flutter_test.dart';
import 'package:nncthang_todoapp/redux/actions/authentication_actions.dart';

import '../data_test/store_data_test.dart';

main() {
  var store = storeDataTest;

  group('Auth Reducer Test', () {
    test('should return signingIn = true on SigningInAccountAction', () {
      store.dispatch(SigningInAccountAction());
      expect(store.state.authState.signingIn, true);
    });

    test('should return signingIn = false, error != "" on SignInAccountFailureAction', () {
      store.dispatch(SignInAccountFailureAction(error: "error message"));
      expect(store.state.authState.signingIn, false);
      expect(store.state.authState.error, "error message");
    });

    test('should return signingIn = false, accessToken != "" on SignInAccountSuccessAction', () {
      store.dispatch(SignInAccountSuccessAction(accessToken: "new token"));
      expect(store.state.authState.signingIn, false);
      expect(store.state.authState.accessToken, "new token");
    });
  });
}
