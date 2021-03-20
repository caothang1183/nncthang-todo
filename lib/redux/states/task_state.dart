import 'package:nncthang_todoapp/common/entities/task_response.dart';

class TaskState {
  final TaskResponse taskResponse;
  final bool isLoading;
  final bool updating;
  final String error;
  final DateTime lastUpdated;
  final int statusCode;

  const TaskState({
    this.taskResponse = const TaskResponse(),
    this.isLoading = false,
    this.updating = false,
    this.error = "",
    this.lastUpdated,
    this.statusCode,
  });

  TaskState copyWith({
    TaskResponse taskResponse,
    bool isLoading,
    bool updating,
    String error,
    DateTime lastUpdated,
    int statusCode,
  }) {
    return TaskState(
      taskResponse: taskResponse ?? this.taskResponse,
      isLoading: isLoading ?? this.isLoading,
      updating: updating ?? this.updating,
      error: error ?? this.error,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}
