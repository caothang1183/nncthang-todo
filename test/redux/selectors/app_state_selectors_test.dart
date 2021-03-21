import 'package:flutter_test/flutter_test.dart';
import 'package:nncthang_todoapp/common/emuns.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';

import '../data_test/app_state_data_test.dart';

main() {
  group('AppState Selector Test', () {
    test('should check if there are point to exactly state', () {
      AppState state = appStateDataTest;

      final _appStateSelector = state;

      expect(_appStateSelector.activeBottomTabBar, TodoBottomTabBar.all);

      expect(_appStateSelector.authState.accessToken, "token");
      expect(_appStateSelector.authState.error, "");
      expect(_appStateSelector.authState.signingIn, false);

      expect(_appStateSelector.taskState.taskResponse.tasks.length, 3);
      expect(_appStateSelector.taskState.isLoading, false);
      expect(_appStateSelector.taskState.lastUpdated, DateTime.parse("2020-11-27T22:22:00.000Z"));
    });
  });
}
