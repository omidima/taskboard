import 'package:hive/hive.dart';

part 'task_entity.g.dart';

@HiveType(typeId: 0)
class TaskEntity extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  bool status = false;

  @HiveField(2)
  String time = "00:00";

  @HiveField(3)
  int dayOfMonth = 1;

  @HiveField(4)
  bool? isImportant = false;
}
