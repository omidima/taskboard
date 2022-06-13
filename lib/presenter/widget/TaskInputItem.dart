import 'package:flutter/material.dart';
import 'package:karboard/core/app_theme.dart';
import 'package:karboard/presenter/widget/AppCheckBox.dart';

class TaskInputItem extends StatefulWidget {
  Function(String time, String name) onSave;
  TaskInputItem({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  @override
  State<TaskInputItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskInputItem> {
  String displayTime = "00:00";
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: deactiveColor, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () async {
                var data = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(DateTime(0)));

                if (data != null) {
                  setState(() {
                    displayTime = "${data.hour}:${data.minute}";
                  });
                }
              },
              child: Text(
                displayTime,
                style: const TextStyle(fontSize: 12),
              )),
          Expanded(
            child: SizedBox(
              height: 20,
              child: Center(
                child: TextFormField(
                  controller: _controller,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
          InkWell(
              onTap: () {
                widget.onSave(displayTime, _controller.text);
                setState(() {
                  _controller.clear();
                  displayTime = "00:00";
                });
              },
              child: const Icon(Icons.check))
        ],
      ),
    );
  }
}
