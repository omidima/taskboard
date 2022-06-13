import 'package:flutter/material.dart';
import 'package:karboard/data/database/entity/month_task_entity.dart';
import 'package:karboard/presenter/widget/TaskItem.dart';
import 'package:shamsi_date/shamsi_date.dart';

class TaskHistoryReviewScreen extends StatelessWidget {
  static route(MonthTasksEntiry data) => MaterialPageRoute(
      builder: (builder) => TaskHistoryReviewScreen(
            data: data,
          ));

  MonthTasksEntiry data;
  TaskHistoryReviewScreen({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now = Jalali.now();
    var dayName = Jalali(now.year, now.month, data.day).formatter.wN;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("کارهای شما در روز $dayName ${data.day} ماه"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.tasks!.length,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TaskItem(
                      hasCheckbox: false,
                      onChangeState: (v) {},
                      name: data.tasks![index].name!,
                      date: data.tasks![index].time),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
