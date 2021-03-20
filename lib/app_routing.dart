import 'package:flutter/material.dart';
import 'package:nncthang_todoapp/common/constants/routes.dart';
import 'package:nncthang_todoapp/presentation/pages/add_task/add_task_page.dart';
import 'package:nncthang_todoapp/presentation/pages/edit_task/edit_task_page.dart';
import 'package:nncthang_todoapp/presentation/pages/home/home_page.dart';
import 'package:nncthang_todoapp/presentation/pages/login/login_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginRoute:
      return MaterialPageRoute(builder: (_) => LoginPage());
    case AppRoutes.homeRoute:
      return MaterialPageRoute(builder: (_) => HomePage());
    case AppRoutes.addTaskRoute:
      return MaterialPageRoute(builder: (_) => AddTaskPage());
    case AppRoutes.editTaskRoute:
      return MaterialPageRoute(builder: (_) => EditTaskPage(taskUpdated: settings.arguments));
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(child: Text('No route defined for ${settings.name}')),
              ));
  }
}
