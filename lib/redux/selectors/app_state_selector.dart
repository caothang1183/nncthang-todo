import 'package:flutter_redux/flutter_redux.dart';
import 'package:nncthang_todoapp/common/emuns.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

Store storeSelector(context) => StoreProvider.of<AppState>(context);

AppState appStateSelector(context) => storeSelector(context).state;

TodoBottomTabBar bottomAppBarSelector(AppState state) => state.activeBottomTabBar;