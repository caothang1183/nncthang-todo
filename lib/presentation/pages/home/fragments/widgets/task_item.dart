import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nncthang_todoapp/common/constants/colors.dart';
import 'package:nncthang_todoapp/common/constants/dimens.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/common/utils/datetime_utils.dart';
import 'package:nncthang_todoapp/presentation/widgets/custom_alert_dialog.dart';
import 'package:nncthang_todoapp/redux/actions/route_actions.dart';
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
      padding: EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.greyNavigator,
            width: 0.5,
          ),
        ),
      ),
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
          Column(
            children: [
              Text(
                DateTimeUtils.formatDateTime(task.deadline, DateFormat.ABBR_WEEKDAY),
                style: TextStyle(
                  fontSize: Dimens.mediumFontSize,
                  color: AppColors.darkGrey.withOpacity(0.6),
                ),
              ),
              Text(
                DateTimeUtils.formatDateTime(task.deadline, DateFormat.HOUR24_MINUTE),
                style: TextStyle(
                  fontSize: Dimens.mediumFontSize,
                  color: AppColors.greyNavigator,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                    child: Icon(Icons.edit),
                    onTap: () {
                      storeSelector(context).dispatch(OpenEditTaskPageAction(taskUpdated: task));
                    }),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                    child: Icon(Icons.delete),
                    onTap: () async {
                      return await showDialog(
                        context: context,
                        builder: (context) => CustomAlertDialog(
                          title: "Delete Task",
                          message: "Are you sure?\ntaskId:${task.id}",
                          onNegative: () {
                            storeSelector(context).dispatch(PopPageAction());
                          },
                          onPositive: () {
                            storeSelector(context).dispatch(DeleteTaskAction(taskId: task.id));
                            storeSelector(context).dispatch(PopPageAction());
                          },
                        ),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
