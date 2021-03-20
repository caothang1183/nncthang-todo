import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';

part 'task_response.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class TaskResponse {

  @JsonKey(name: 'data')
  @HiveField(0)
  final List<Task> tasks;

  final String message;

  const TaskResponse({
    this.tasks = const [],
    this.message = "",
  });

  TaskResponse copyWith({
    List<Task> tasks,
  }) {
    return TaskResponse(
      tasks: tasks ?? this.tasks,
    );
  }

  factory TaskResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TaskResponseToJson(this);

}