// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskResponseAdapter extends TypeAdapter<TaskResponse> {
  @override
  final int typeId = 1;

  @override
  TaskResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskResponse(
      tasks: (fields[0] as List)?.cast<Task>(),
    );
  }

  @override
  void write(BinaryWriter writer, TaskResponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.tasks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskResponse _$TaskResponseFromJson(Map<String, dynamic> json) {
  return TaskResponse(
    tasks: (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Task.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$TaskResponseToJson(TaskResponse instance) =>
    <String, dynamic>{
      'data': instance.tasks,
      'message': instance.message,
    };
