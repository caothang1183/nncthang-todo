import 'package:flutter/foundation.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/common/entities/task_response.dart';

class LoadTasksAction {
  String toString() {
    return 'LoadTasksAction{}';
  }
}

class LoadingTasksAction {
  String toString() {
    return 'LoadingTasksAction{}';
  }
}

class LoadTasksSuccessAction {
  final TaskResponse taskResponse;

  LoadTasksSuccessAction({this.taskResponse});

  String toString() {
    return 'LoadTasksSuccessAction{taskResponse: ${this.taskResponse}}';
  }
}

class LoadTasksFailureAction {
  final String error;

  LoadTasksFailureAction({this.error});

  String toString() {
    return 'LoadTasksFailureAction{error: ${this.error}}';
  }
}

class UpdateTaskStatusAction {
  final String taskId;

  UpdateTaskStatusAction({@required this.taskId});

  String toString() {
    return 'UpdateTaskStatusAction{task: ${this.taskId}}';
  }
}

class UpdatingTaskStatusAction {

  String toString() {
    return 'UpdatingTaskStatusAction{}';
  }
}


class UpdateTaskStatusSuccessAction {
  final Task taskUpdated;

  UpdateTaskStatusSuccessAction({@required this.taskUpdated});

  String toString() {
    return 'UpdateTaskStatusSuccessAction{}';
  }
}

class UpdateTaskStatusFailureAction {
  final String error;

  UpdateTaskStatusFailureAction({@required this.error});

  String toString() {
    return 'UpdateTaskStatusFailureAction{error: ${this.error}}';
  }
}

class DeleteTaskAction {
  final String taskId;

  DeleteTaskAction({this.taskId});

  String toString() {
    return 'DeleteTaskAction{taskId: $taskId}';
  }
}

class DeleteTaskSuccessAction {
  final String id;

  DeleteTaskSuccessAction({this.id});

  String toString() {
    return 'DeleteTaskSuccessAction{}';
  }
}

class DeleteTaskFailureAction {
  final String error;

  DeleteTaskFailureAction({@required this.error});

  String toString() {
    return 'DeleteTaskFailureAction{error: ${this.error}}';
  }
}

class AddTaskAction {
  final Task task;

  AddTaskAction({this.task});

  String toString() {
    return 'AddTaskAction{}';
  }
}

class AddingTaskAction {

  String toString() {
    return 'AddingTaskAction{}';
  }
}

class AddTaskSuccessAction {
  final Task task;

  AddTaskSuccessAction({this.task});

  String toString() {
    return 'AddTaskSuccessAction{}';
  }
}

class AddTaskFailureAction {
  final String error;

  AddTaskFailureAction({@required this.error});

  String toString() {
    return 'AddTaskFailureAction{error: ${this.error}}';
  }
}

class EditTaskAction {
  final Task task;

  EditTaskAction({this.task});

  String toString() {
    return 'EditTaskAction{}';
  }
}

class EditingTaskAction {

  String toString() {
    return 'EditingTaskAction{}';
  }
}

class EditTaskSuccessAction {
  final Task task;

  EditTaskSuccessAction({this.task});

  String toString() {
    return 'EditTaskSuccessAction{}';
  }
}

class EditTaskFailureAction {
  final String error;

  EditTaskFailureAction({@required this.error});

  String toString() {
    return 'EditTaskFailureAction{error: ${this.error}}';
  }
}



