import 'package:hive/hive.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/common/entities/task_response.dart';
import 'package:nncthang_todoapp/data/database_constants.dart';
import 'package:nncthang_todoapp/data/models/tasks_data.dart';

Box _task = Hive.box<TasksData>(DatabaseConstants.TASKS);

void storeTasksData(TasksData data) {
  _task.add(data);
}

void clearTaskData() {
  _task.clear();
}

TasksData getNewestTaskData(){
  Map<dynamic, dynamic> raw = _task.toMap();
  TasksData data;
  if (raw.length > 0) {
    List<TasksData> list = raw.values.toList();
    if (list.length > 0) {
      list.sort((a, b) => b.updatedDate.compareTo(a.updatedDate));
      data = list.first;
    }
  }
  return data;
}

TasksData addTaskData(Task newTask) {
  TasksData data = getNewestTaskData();
  var list = data.taskResponse.tasks;
  list.add(newTask);
  TaskResponse newData = TaskResponse(tasks: list);
  data.taskResponse = newData;
  data.save();
  return data;
}

TasksData updateTask(Task taskUpdated) {
  TasksData data = getNewestTaskData();
  var list = data.taskResponse.tasks;
  List<Task> updatedTasks = list.map((Task task) {
    if (task.id == taskUpdated.id) {
      return taskUpdated;
    }
    return task;
  }).toList();
  TaskResponse newData = TaskResponse(tasks: updatedTasks);
  data.taskResponse = newData;
  data.save();
  return data;
}

TasksData updateTaskStatus(Task taskUpdated) {
  TasksData data = getNewestTaskData();
  var list = data.taskResponse.tasks;
  List<Task> updatedTasks = list.map((Task task) {
    if (task.id == taskUpdated.id) {
      return task.copyWith(complete: !task.complete);
    }
    return task;
  }).toList();
  TaskResponse newData = TaskResponse(tasks: updatedTasks);
  data.taskResponse = newData;
  data.save();
  return data;
}

TasksData deleteTaskStatus(String id) {
  TasksData data = getNewestTaskData();
  var list = data.taskResponse.tasks;
  List<Task> updatedTasks = [];
  list.forEach((Task task) {
    if (task.id != id) {
      updatedTasks.add(task);
    }
  });
  TaskResponse newData = TaskResponse(tasks: updatedTasks);
  data.taskResponse = newData;
  data.save();
  return data;
}
