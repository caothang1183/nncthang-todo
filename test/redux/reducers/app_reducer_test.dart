import 'package:flutter_test/flutter_test.dart';
import 'package:nncthang_todoapp/common/emuns.dart';
import 'package:nncthang_todoapp/redux/actions/app_actions.dart';

import '../data_test/store_data_test.dart';

main() {
  var store = storeDataTest;

  group('App Reducer Test', () {
    test('should update the activeBottomTabBar on SelectBottomTabBarAction', () {
      expect(store.state.activeBottomTabBar, TodoBottomTabBar.all);

      store.dispatch(SelectBottomTabBarAction(activeBottomTabBar: TodoBottomTabBar.complete));
      expect(store.state.activeBottomTabBar, TodoBottomTabBar.complete);

      store.dispatch(SelectBottomTabBarAction(activeBottomTabBar: TodoBottomTabBar.incomplete));
      expect(store.state.activeBottomTabBar, TodoBottomTabBar.incomplete);

      store.dispatch(SelectBottomTabBarAction(activeBottomTabBar: TodoBottomTabBar.all));
      expect(store.state.activeBottomTabBar, TodoBottomTabBar.all);
    });
  });
}
