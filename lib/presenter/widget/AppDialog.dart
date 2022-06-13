import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  String title;
  Widget child;
  AppDialog({required this.title, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Text(title),
        ),
        const Divider(),
        Container(
          margin: const EdgeInsets.all(12),
          child: child,
        )
      ],
    );
  }
}
