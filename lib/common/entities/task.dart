import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class Task {

  @JsonKey(name: '_id')
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String task;

  @HiveField(2)
  final String note;

  @HiveField(3)
  final bool complete;

  @HiveField(4)
  final String deadline;

  @JsonKey(name: 'created_date')
  @HiveField(5)
  final String createdDate;

  Task({
    this.id = "",
    this.task = "",
    this.note = "",
    this.complete = false,
    this.deadline = "",
    this.createdDate = "",
  });

  Task copyWith({
    String id,
    String task,
    String note,
    bool complete,
    String deadline,
    String createdDate,
  }) {
    return Task(
      id: id ?? this.id,
      task: task ?? this.task,
      note: note ?? this.note,
      complete: complete ?? this.complete,
      deadline: deadline ?? this.deadline,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) =>
      _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
