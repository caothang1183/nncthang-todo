import 'package:nncthang_todoapp/common/entities/task.dart';

class OpenEditTaskPageAction {
  final Task taskUpdated;

  OpenEditTaskPageAction({this.taskUpdated});

  String toString() {
    return 'OpenEditTaskPageAction{taskId: ${taskUpdated.id}}';
  }
}

class OpenAddTaskPageAction {
  String toString() {
    return 'OpenAddTaskPageAction{}';
  }
}

class OpenHomePageAction {
  String toString() {
    return 'OpenHomePageAction{}';
  }
}

class OpenLoginPageAction {
  String toString() {
    return 'OpenLoginPageAction{}';
  }
}

class PopPageAction {
  String toString() {
    return 'PopPageAction{}';
  }
}