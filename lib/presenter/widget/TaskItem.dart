import 'package:flutter/material.dart';
import 'package:karboard/core/app_theme.dart';
import 'package:karboard/presenter/widget/AppCheckBox.dart';

class TaskItem extends StatefulWidget {
  bool state;
  Function(bool value) onChangeState;
  String name;
  String date;
  String type;
  bool hasCheckbox;
  TaskItem(
      {Key? key,
      required this.onChangeState,
      required this.name,
      this.hasCheckbox = true,
      this.type = CheckboxType.check,
      required this.date,
      this.state = false})
      : super(key: key);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  _getTime() {
    return widget.date;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: deactiveColor, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                widget.hasCheckbox ? AppCheckBox(
                  onChange: (value) {
                    widget.onChangeState(value);
                  },
                  initValue: widget.state,
                  type: widget.type,
                ) : Container(),
                const SizedBox(
                  width: 10,
                ),
                Text(widget.name),
              ],
            ),
          ),
          Text(_getTime())
        ],
      ),
    );
  }
}
