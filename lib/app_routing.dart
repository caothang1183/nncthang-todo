import 'package:flutter/material.dart';
import 'package:nncthang_todoapp/common/constants/routes.dart';
import 'package:nncthang_todoapp/presentation/pages/add_task_page.dart';
import 'package:nncthang_todoapp/presentation/pages/home_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homeRoute:
      return MaterialPageRoute(builder: (_) => HomePage());
    case AppRoutes.addTaskRoute:
      return MaterialPageRoute(builder: (_) => AddTaskPage());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(child: Text('No route defined for ${settings.name}')),
              ));
  }
}
