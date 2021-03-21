import 'package:flutter_test/flutter_test.dart';
import 'package:nncthang_todoapp/common/emuns.dart';

import '../data_test/app_state_data_test.dart';

main() {
  final state = appStateDataTest;

  group('AppState Test', () {
    test('Value from AppState\'s activeBottomTabBar should return expected value', () {
      expect(state.activeBottomTabBar, TodoBottomTabBar.all);
    });

    test('Value from AppState\'s authState should return expected value', () {
      expect(state.authState.accessToken, "token");
      expect(state.authState.lastSigningIn, DateTime.parse("2020-11-27T22:22:00.000Z"));
      expect(state.authState.error, "");
      expect(state.authState.signingIn, false);
    });

    test('Value from AppState\'s taskState should return expected value', () {
      expect(state.taskState.error, "");
      expect(state.taskState.statusCode, 200);
      expect(state.taskState.lastUpdated, DateTime.parse("2020-11-27T22:22:00.000Z"));
      expect(state.taskState.isLoading, false);
      expect(state.taskState.updating, false);
      expect(state.taskState.taskResponse.tasks.length, 3);
    });
  });
}
