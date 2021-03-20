import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:nncthang_todoapp/common/constants/dimens.dart';
import 'package:nncthang_todoapp/common/utils/datetime_utils.dart';

class DeadlinePicker extends StatelessWidget {
  final String deadline;
  final Function(DateTime date) onPicked;

  const DeadlinePicker({
    Key key,
    this.deadline,
    this.onPicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          color: Colors.white70,
          onPressed: () {
            DatePicker.showDateTimePicker(
              context,
              showTitleActions: true,
              onChanged: onPicked,
              onConfirm: onPicked,
              currentTime: DateTime.now(),
            );
          },
          child: Text(
            'Deadline picker',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        SizedBox(width: Dimens.defaultPadding),
        Text(DateTimeUtils.formatDateTime(deadline, DateFormat.ABBR_WEEKDAY) +
            ", " +
            DateTimeUtils.formatDateTime(deadline, DateFormat.HOUR24_MINUTE) +
            ' (${DateTimeUtils.formatDateTime(deadline, DateFormat.YEAR_MONTH_DAY)})'),
      ],
    );
  }
}
