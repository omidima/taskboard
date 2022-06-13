import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CheckboxType {
  static const String important = 'important';
  static const String check = 'check';
}

class AppCheckBox extends StatefulWidget {
  Function(bool value) onChange;
  bool initValue;
  String type;
  AppCheckBox({
    Key? key,
    required this.onChange,
    required this.initValue,
    this.type = CheckboxType.check,
  }) : super(key: key);

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  late bool _check;

  @override
  void initState() {
    _check = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Image.asset(
          _check ? 'assets/icons/${widget.type}.png' : 'assets/icons/un${widget.type}.png'),
      onTap: () {
        setState(() {
          _check = !_check;
          widget.onChange(_check);
        });
      },
    );
  }
}
