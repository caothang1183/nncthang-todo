import 'package:hive/hive.dart';
import 'package:nncthang_todoapp/common/entities/task_response.dart';

part 'tasks_data.g.dart';
@HiveType(typeId: 0)
class TasksData extends HiveObject {

  @HiveField(0)
  TaskResponse taskResponse;
  @HiveField(1)
  DateTime updatedDate;

  TasksData({
    this.taskResponse,
    this.updatedDate,
  });
}
