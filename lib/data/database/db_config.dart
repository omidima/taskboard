import 'package:hive_flutter/hive_flutter.dart';
import 'package:karboard/data/database/entity/task_entity.dart';

import 'entity/month_task_entity.dart';

class DbConfig {
  final daily_db = "daily-db";
  final monthly_db = "monthly-db";

  static final DbConfig _instance = DbConfig._internal();
  DbConfig._internal();

  init() async {
    dailyDb = await Hive.openBox<TaskEntity>(daily_db);
    monthlyDb = await Hive.openBox<MonthTasksEntiry>(monthly_db);
    // dailyDbStream = Hive.box(daily_db).watch();
    // monthlyDbStream = Hive.box(monthly_db).watch();
  }

  static DbConfig get getInstance => _instance;

  late Box dailyDb;
  late Box monthlyDb;
  late Stream<BoxEvent> dailyDbStream;
  late Stream<BoxEvent> monthlyDbStream;
}
