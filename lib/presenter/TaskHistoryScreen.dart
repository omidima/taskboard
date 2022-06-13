import 'package:flutter/material.dart';
import 'package:karboard/core/app_theme.dart';
import 'package:karboard/data/database/db_config.dart';
import 'package:karboard/data/database/entity/month_task_entity.dart';
import 'package:karboard/presenter/TaskHistory/TaskHistoryReviewScreen.dart';
import 'package:karboard/presenter/widget/AppBarScreen.dart';
import 'package:shamsi_date/shamsi_date.dart';

class TaskHistoyList extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const TaskHistoyList());
  const TaskHistoyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              AppBarScreen(title: "تاریخچه کارها", action: Container()),
              const SizedBox(
                height: 20,
              ),
              Expanded(child: _renderDayItem()),
              const Text("با کلیک کردن بر روی هر کدام از روزهای این ماه میتوانید فعالیت‌های خود را در آن روز مشاهده کرده و وضعیت کارهای خود را برسی نمایید." +
                  "شما میتوانید لیست کارهای خود را پرینت نمایید و بر روی کاغد یا در یک فایل pdf ذخیره سازی بنمایید",
                  style: TextStyle(
                    color: Colors.grey
                  ),
                  )
            ],
          ),
        ),
      ),
    );
  }

  _calcMonthDay() {
    int month = Jalali.now().month;
    if (month == 12) {
      return 29;
    } else if (month >= 6) {
      return 30;
    } else {
      return 31;
    }
  }

  _renderDayItem() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: _calcMonthDay(),
      // shrinkWrap: true,
      itemBuilder: (context, index) {
        var tasks = DbConfig.getInstance.monthlyDb.get(index + 1);
        tasks ??= MonthTasksEntiry()
          ..day = index + 1
          ..tasks = [];
        double itemHeight = 15;
        if (tasks.day <= Jalali.now().day) {
          if (tasks.tasks == null || tasks.tasks!.isEmpty) {
            return Container(
              width: itemHeight,
              height: itemHeight,
              margin: const EdgeInsets.all(2.5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: deactiveColor,
              ),
              child: Text((index + 1).toString()),
            );
          } else {
            return InkWell(
              onTap: () => Navigator.of(context)
                  .push(TaskHistoryReviewScreen.route(tasks)),
              child: Container(
                width: itemHeight,
                height: itemHeight,
                margin: const EdgeInsets.all(2.5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: secoundColor,
                ),
                child: Text((index + 1).toString()),
              ),
            );
          }
        } else {
          return Container(
            width: itemHeight,
            height: itemHeight,
            margin: const EdgeInsets.all(2.5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: primaryColors),
              color: Colors.white,
            ),
            child: Text((index + 1).toString()),
          );
        }
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          childAspectRatio: 1,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
    );
  }
}
