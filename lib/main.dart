import 'package:flutter/material.dart';
import 'package:nncthang_todoapp/app.dart';
import 'package:nncthang_todoapp/data/database_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseManager.initialize();
  runApp(App());
}
