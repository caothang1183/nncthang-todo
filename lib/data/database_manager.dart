import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/common/entities/task_response.dart';
import 'package:nncthang_todoapp/data/database_constants.dart';
import 'package:nncthang_todoapp/data/models/tasks_data.dart';

class DataBaseManager {
  static final DataBaseManager _instance = DataBaseManager._internal();

  factory DataBaseManager() {
    return _instance;
  }

  DataBaseManager._internal();

  /// avoid call multiple time for dev environment
  static bool _isLoaded = false;

  static Future<void> initialize() async {
    if(_isLoaded) return;
    await close();
    await connectHiveDatabase();
    _isLoaded = true;
  }

  static Future<void> connectHiveDatabase() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TasksDataAdapter());
    Hive.registerAdapter(TaskResponseAdapter());
    Hive.registerAdapter(TaskAdapter());

    await _instance._openTaskBox();
  }

  Future _openTaskBox() async {
    return await Hive.openBox<TasksData>(DatabaseConstants.TASKS);
  }

  static Future close() {
    return Hive.close();
  }
}
