import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nncthang_todoapp/common/constants/colors.dart';
import 'package:nncthang_todoapp/common/constants/dimens.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/presentation/pages/home/fragments/widgets/task_item.dart';

void main() {
  group("TaskItem on HomePage Fragments Widget Test", () {
    testWidgets('test TaskItem display details', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TaskItem(
              task: Task(
                id: "1",
                task: "Test DateTimeUtils",
                deadline: "2021-03-21T13:00:00.000Z",
                complete: true,
                note: "DateTimeUtils test functions",
                createdDate: "2021-03-21T12:00:00.000Z",
              ),
            ),
          ),
        ),
      );

      expect(find.byKey(ValueKey('task_item')), findsOneWidget);

      final txtTask = tester.firstWidget(find.byKey(ValueKey('txt_task'))) as Text;
      expect(txtTask.data, "Test DateTimeUtils");
      expect(txtTask.style.color, AppColors.darkGrey);
      expect(txtTask.style.fontSize, Dimens.mediumFontSize);

      final txtTaskNote = tester.firstWidget(find.byKey(ValueKey('txt_task_note'))) as Text;
      expect(txtTaskNote.data, "DateTimeUtils test functions");
      expect(txtTaskNote.style.color, AppColors.greyNavigator);
      expect(txtTaskNote.style.fontSize, Dimens.mediumFontSize);

      final txtTaskDeadline = tester.firstWidget(find.byKey(ValueKey('txt_task_deadline'))) as Text;
      expect(txtTaskDeadline.data, "Sun");
      expect(txtTaskDeadline.style.color, AppColors.darkGrey.withOpacity(0.6));
      expect(txtTaskDeadline.style.fontSize, Dimens.mediumFontSize);

      final txtTaskDeadlineTime = tester.firstWidget(find.byKey(ValueKey('txt_task_deadline_time'))) as Text;
      expect(txtTaskDeadlineTime.data, "13:00");
      expect(txtTaskDeadlineTime.style.color, AppColors.greyNavigator);
      expect(txtTaskDeadlineTime.style.fontSize, Dimens.mediumFontSize);
    });
  });
}
