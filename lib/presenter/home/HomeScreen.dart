import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karboard/data/database/entity/task_entity.dart';
import 'package:karboard/logic/home/cubit/home_cubit.dart';
import 'package:karboard/presenter/TaskHistoryScreen.dart';
import 'package:karboard/presenter/widget/AppBarScreen.dart';

import '../../core/app_theme.dart';
import '../widget/TaskItem.dart';
import 'addTask/addTasks.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 12)
                        .copyWith(bottom: 0),
                children: [
                  AppBarScreen(
                      title: 'کارهای ضروری',
                      action: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BlocProvider.value(
                                value: BlocProvider.of<HomeCubit>(context),
                                child: AddTaskScreen()),
                          ));
                        },
                        color: secoundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'ویرایش کارها',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            Image.asset(
                              "assets/icons/edit.png",
                              width: 24,
                            )
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  _importantList(),
                  const SizedBox(
                    height: 20,
                  ),
                  AppBarScreen(title: 'کارهای روزانه شما', action: Container()),
                  const SizedBox(
                    height: 20,
                  ),
                  _taskList(),
                ],
              ),
            ),
            _footer()
          ],
        ),
      ),
    );
  }

  _importantList() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        Map<int, TaskEntity> items = {};
        if (state is EditTaskList) {
          state.items.asMap().forEach((index, element) {
            if (element.isImportant != null && element.isImportant!) {
              items[index] = element;
            }
          });

          return Column(
            children: List.generate(items.length, (index) {
              var task = items.entries.toList()[index].value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TaskItem(
                  onChangeState: (b) {
                    var item = items.entries.toList()[index];
                    item.value.status = b;
                    state.items[item.key] = item.value;

                    BlocProvider.of<HomeCubit>(context)
                        .changeTaskState(state.items);
                  },
                  date: task.time,
                  state: task.status,
                  name: task.name.toString(),
                ),
              );
            }),
          );
        }
        return Container();
      },
    );
  }

  _taskList() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        Map<int, TaskEntity> items = {};
        if (state is EditTaskList) {
          state.items.asMap().forEach((index, element) {
            if (element.isImportant != null && !element.isImportant!) {
              items[index] = element;
            }
          });
          return Column(
              children: List.generate(items.length, (index) {
            var task = items.entries.toList()[index].value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TaskItem(
                onChangeState: (b) {
                  var item = items.entries.toList()[index];
                  item.value.status = b;
                  state.items[item.key] = item.value;

                  BlocProvider.of<HomeCubit>(context)
                      .changeTaskState(state.items);
                },
                date: task.time,
                state: task.status,
                name: task.name.toString(),
              ),
            );
          }));
        }
        return Container();
      },
    );
  }

  _footer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      decoration: const BoxDecoration(
          color: secoundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        children: [
          const Text(
              'شاید بهترین بازیکن این دنیا نباشی، اما یادت باشه رونالدو هم بهترین استعداد قوتبالی نبود، فقط توی راهی که داشت جا نزد.'),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            minWidth: double.infinity,
            height: 52,
            onPressed: () {
              Navigator.of(context).push(TaskHistoyList.route());
            },
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: primaryColors)),
            child: const Text('بررسی کارهای این ماه'),
          )
        ],
      ),
    );
  }
}
