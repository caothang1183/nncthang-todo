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
  final int statusCode;

  UpdateTaskStatusSuccessAction({@required this.taskUpdated, @required this.statusCode});

  String toString() {
    return 'UpdateTaskStatusSuccessAction{statusCode: ${this.statusCode}}';
  }
}

class UpdateTaskStatusFailureAction {
  final String error;

  UpdateTaskStatusFailureAction({@required this.error});

  String toString() {
    return 'UpdateTaskStatusFailureAction{error: ${this.error}}';
  }
}




