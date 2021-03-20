import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nncthang_todoapp/common/constants/colors.dart';
import 'package:nncthang_todoapp/common/constants/dimens.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/common/utils/datetime_utils.dart';
import 'package:nncthang_todoapp/redux/actions/task_actions.dart';
import 'package:nncthang_todoapp/redux/selectors/app_state_selector.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({
    Key key,
    @required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0).copyWith(left: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: task.complete,
            onChanged: (complete) {
              storeSelector(context).dispatch(UpdateTaskStatusAction(taskId: task.id));
            },
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.task,
                  style: TextStyle(
                    fontSize: Dimens.mediumFontSize,
                    color: AppColors.darkGrey,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  task.note,
                  style: TextStyle(
                    fontSize: Dimens.mediumFontSize,
                    color: AppColors.greyNavigator,
                  ),
                ),
              ],
            ),
          ),
          Text(
            DateTimeUtils.formatDateTime(task.createdDate, DateFormat.HOUR24_MINUTE),
            style: TextStyle(
              fontSize: Dimens.mediumFontSize,
              color: AppColors.greyNavigator,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(child: Icon(Icons.edit), onTap: () {}),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(child: Icon(Icons.delete), onTap: () {}),
              ),
            ],
          ),
        ],
      ),
    );
  }
}