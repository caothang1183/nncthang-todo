import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function onNegative;
  final Function onPositive;

  const CustomAlertDialog({
    Key key,
    this.title,
    this.message,
    this.onNegative,
    this.onPositive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        MaterialButton(
          child: Text("OK"),
          onPressed: onPositive,
        ),
        MaterialButton(
          child: Text("Cancel"),
          onPressed: onNegative,
        ),
      ],
    );
  }
}
