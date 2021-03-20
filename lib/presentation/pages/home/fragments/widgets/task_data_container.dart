import 'package:flutter/material.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/presentation/pages/home/fragments/widgets/task_list.dart';
import 'package:nncthang_todoapp/presentation/widgets/custom_progress_indicator.dart';

class TaskDataContainer extends StatefulWidget {
  final bool isLoading;
  final bool updating;
  final String error;
  final List<Task> tasks;

  const TaskDataContainer({
    Key key,
    this.isLoading,
    this.updating,
    this.error,
    this.tasks,
  }) : super(key: key);

  @override
  _TaskDataContainerState createState() => _TaskDataContainerState();
}

class _TaskDataContainerState extends State<TaskDataContainer> {
  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return CustomProgressIndicator(size: 25, message: "Loading task...",);
    }
    if (widget.error != "") {
      return Text(widget.error);
    }
    if (widget.updating) {
      return CustomProgressIndicator(message: "Updating Task...",);
    }
    return TaskList(tasks: widget.tasks);
  }
}
