import 'package:flutter_redux/flutter_redux.dart';
import 'package:nncthang_todoapp/common/emuns.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';

AppState appStateSelector(context) => StoreProvider.of<AppState>(context).state;

TodoBottomTabBar bottomAppBarSelector(AppState state) => state.activeBottomTabBar;