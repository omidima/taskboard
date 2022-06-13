// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'month_task_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MonthTasksEntiryAdapter extends TypeAdapter<MonthTasksEntiry> {
  @override
  final int typeId = 1;

  @override
  MonthTasksEntiry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MonthTasksEntiry()
      ..day = fields[0] as int
      ..tasks = (fields[1] as List?)?.cast<TaskEntity>();
  }

  @override
  void write(BinaryWriter writer, MonthTasksEntiry obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.tasks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MonthTasksEntiryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
