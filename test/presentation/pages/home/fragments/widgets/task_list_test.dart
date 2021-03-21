import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/presentation/pages/home/fragments/widgets/task_list.dart';

void main() {
  group("TaskList on HomePage Fragments Widget Test", () {
    testWidgets('test TaskList display details', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TaskList(
              tasks: [
                Task(
                  id: "1",
                  task: "Test 1",
                  deadline: "2021-03-21T13:00:00.000Z",
                  complete: true,
                  note: "Task test 1",
                ),
                Task(
                  id: "2",
                  task: "Test 2",
                  deadline: "2021-03-21T13:00:00.000Z",
                  complete: true,
                  note: "Task test 2",
                ),
                Task(
                  id: "3",
                  task: "Test 3",
                  deadline: "2021-03-21T13:00:00.000Z",
                  complete: true,
                  note: "Task test 3",
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byKey(ValueKey('task_list')), findsOneWidget);
      expect(find.byKey(ValueKey('task_item')), findsNWidgets(3));
    });
  });
}