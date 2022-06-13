import 'package:hive_flutter/hive_flutter.dart';
import 'package:karboard/data/database/entity/task_entity.dart';

part 'month_task_entity.g.dart';

@HiveType(typeId: 1)
class MonthTasksEntiry {
  @HiveField(0)
  int day = 1;

  @HiveField(1)
  List<TaskEntity>? tasks;
}

