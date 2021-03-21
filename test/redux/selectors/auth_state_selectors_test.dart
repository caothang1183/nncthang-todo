import 'package:flutter_test/flutter_test.dart';
import 'package:nncthang_todoapp/redux/selectors/auth_state_selectors.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';

import '../data_test/app_state_data_test.dart';

main() {
  group('Authentication State Selector Test', () {
    test('should check if there are point to exactly state', () {
      AppState state = appStateDataTest;

      final _authStateSelector = authStateSelector(state);

      expect(_authStateSelector.accessToken, "token");
      expect(_authStateSelector.signingIn, false);
      expect(_authStateSelector.lastSigningIn, DateTime.parse("2020-11-27T22:22:00.000Z"));
      expect(_authStateSelector.error, "");
    });
  });
}
