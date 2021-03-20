
import 'package:flutter/material.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/presentation/pages/home/fragments/widgets/task_item.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  const TaskList({
    Key key,
    this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => TaskItem(
        task: tasks[index],
      ),
      itemCount: tasks.length,
    );
  }
}