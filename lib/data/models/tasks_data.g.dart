// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasksDataAdapter extends TypeAdapter<TasksData> {
  @override
  final int typeId = 0;

  @override
  TasksData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TasksData(
      taskResponse: fields[0] as TaskResponse,
      updatedDate: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TasksData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.taskResponse)
      ..writeByte(1)
      ..write(obj.updatedDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasksDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
