import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../../../data/database/db_config.dart';
import '../../../data/database/entity/month_task_entity.dart';
import '../../../data/database/entity/task_entity.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getInitTaskList();
  }

  getInitTaskList() {
    var items = DbConfig.getInstance.monthlyDb.get(Jalali.now().day);

    if (items != null) {
      emit(EditTaskList(items: items.tasks));
    }
  }

  changeTaskList(List<TaskEntity> items) {
    emit(EditTaskList(items: items));
  }

  changeTaskState(List<TaskEntity> items) {
    DbConfig.getInstance.monthlyDb.put(
        Jalali.now().day,
        MonthTasksEntiry()
          ..day = Jalali.now().day
          ..tasks = items);

    emit(EditTaskList(items: items));
  }
}
