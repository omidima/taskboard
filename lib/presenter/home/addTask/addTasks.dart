import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../../../data/database/db_config.dart';
import '../../../data/database/entity/month_task_entity.dart';
import '../../../data/database/entity/task_entity.dart';
import '../../../logic/home/cubit/home_cubit.dart';
import '../../widget/AppCheckBox.dart';
import '../../widget/TaskInputItem.dart';
import '../../widget/TaskItem.dart';

class AddTaskScreen extends StatefulWidget {
  bool isEditing;
  AddTaskScreen({this.isEditing = false, Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AddTaskScreen> {
  List<TaskEntity> items = [];

  @override
  void initState() {
    var temp = DbConfig.getInstance.monthlyDb.get(Jalali.now().day );

    if (temp != null) {
      items = temp.tasks;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              items.removeAt(index);
                            });
                          },
                          icon: const Icon(Icons.close)),
                      Expanded(
                        child: TaskItem(
                            type: CheckboxType.important,
                            state: items[index].isImportant != null ? items[index].isImportant! : false,
                            onChangeState: (e) {
                              items[index]..isImportant = e;
                            },
                            name: items[index].name!,
                            date: items[index].time),
                      ),
                    ],
                  ),
                );
              },
            )),
            TaskInputItem(
              onSave: (time, text) {
                var item = TaskEntity()
                  ..dayOfMonth = Jalali.now().day
                  ..name = text
                  ..time = time;
      
                items.add(item);
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }


  @override
  void deactivate() {
    BlocProvider.of<HomeCubit>(context).changeTaskList(items);

    super.deactivate();
  }
  @override
  void dispose() {
    // DbConfig.getInstance.monthlyDb.clear();
    MonthTasksEntiry item = MonthTasksEntiry()
      ..day = Jalali.now().day
      ..tasks = items;
    DbConfig.getInstance.monthlyDb.put(Jalali.now().day, item);


    super.dispose();
  }
}
