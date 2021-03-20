import 'package:flutter/material.dart';
import 'package:nncthang_todoapp/app.dart';
import 'package:nncthang_todoapp/common/constants/routes.dart';
import 'package:nncthang_todoapp/redux/actions/route_actions.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> routerMiddleware() {
  return [
    TypedMiddleware<AppState, OpenAddTaskPageAction>(_openAddTaskPage),
    TypedMiddleware<AppState, OpenHomePageAction>(_openHomePage),
    TypedMiddleware<AppState, OpenLoginPageAction>(_openLoginPage),
  ];
}

_openAddTaskPage(Store<AppState> store, action, NextDispatcher next) {
  navigatorKey.currentState.pushNamed(AppRoutes.addTaskRoute);
  next(action);
}

_openHomePage(Store<AppState> store, action, NextDispatcher next) {
  navigatorKey.currentState.pushNamedAndRemoveUntil(
    AppRoutes.homeRoute,
        (Route<dynamic> route) => false,
  );
  next(action);
}

_openLoginPage(Store<AppState> store, action, NextDispatcher next) {
  navigatorKey.currentState.pushNamedAndRemoveUntil(
    AppRoutes.loginRoute,
        (Route<dynamic> route) => false,
  );
  next(action);
}