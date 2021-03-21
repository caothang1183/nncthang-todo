import 'package:flutter_test/flutter_test.dart';

import '../data_test/app_state_data_test.dart';

main() {
  final state = appStateDataTest;

  group('AuthState Test', () {
    test('Value from AuthState should return expected value', () {
      expect(state.authState.accessToken, "token");
      expect(state.authState.lastSigningIn, DateTime.parse("2020-11-27T22:22:00.000Z"));
      expect(state.authState.error, "");
      expect(state.authState.signingIn, false);
    });
  });
}
