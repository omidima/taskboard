import 'package:flutter/material.dart';

class AppBarScreen extends StatelessWidget {
  String title;
  Widget action;
  AppBarScreen({required this.title, required this.action, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const SizedBox(
              height: 8.5,
            ),
            Container(
              width: 150,
              height: 3,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(5)),
            )
          ],
        ),
        action
      ],
    );
  }
}
