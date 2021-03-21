import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nncthang_todoapp/common/constants/colors.dart';
import 'package:nncthang_todoapp/common/constants/dimens.dart';
import 'package:nncthang_todoapp/presentation/widgets/complete_check_box.dart';

void main() {
  group("CompleteCheckBox on AddTaskPage and EditTaskPage Widget Test", () {
    testWidgets('test CompleteCheckBox display details', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CompleteCheckBox(
              value: true,
              onChanged: (newValue) => print(newValue),
            ),
          ),
        ),
      );
      expect(find.byKey(ValueKey('complete_check_box')), findsOneWidget);

      final checkBoxTitle = tester.firstWidget(find.byKey(ValueKey('complete_check_box_title'))) as Text;
      expect(checkBoxTitle.data, "Complete");
      expect(checkBoxTitle.style.color, AppColors.darkGrey);
      expect(checkBoxTitle.style.fontSize, Dimens.fontSize);

    });
  });
}
