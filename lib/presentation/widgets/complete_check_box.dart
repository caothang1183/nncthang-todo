import 'package:flutter/material.dart';

class CompleteCheckBox extends StatelessWidget {
  final bool value;
  final Function(bool newValue) onChanged;

  const CompleteCheckBox({
    Key key,
    this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      title: Text("Complete"),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
    );
  }
}
