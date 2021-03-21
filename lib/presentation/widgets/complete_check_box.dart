import 'package:flutter/material.dart';
import 'package:nncthang_todoapp/common/constants/colors.dart';
import 'package:nncthang_todoapp/common/constants/dimens.dart';

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
      key: ValueKey("complete_check_box"),
      contentPadding: EdgeInsets.zero,
      title: Text(
        "Complete",
        style: TextStyle(
          color: AppColors.darkGrey,
          fontSize: Dimens.fontSize,
        ),
        key: ValueKey("complete_check_box_title"),
      ),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
    );
  }
}
