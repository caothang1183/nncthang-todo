import 'package:nncthang_todoapp/common/emuns.dart';

class SelectBottomTabBarAction {
  final TodoBottomTabBar activeBottomTabBar;

  SelectBottomTabBarAction({this.activeBottomTabBar});

  @override
  String toString() {
    return "SelectBottomTabBarAction{activeBottomTabBar : ${this.activeBottomTabBar}}";
  }
}
