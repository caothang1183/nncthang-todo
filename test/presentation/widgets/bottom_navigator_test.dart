import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nncthang_todoapp/presentation/widgets/bottom_navigator.dart';

void main() {

  group("BottomTabBar on HomePage Widget Test", () {
    testWidgets('test display BottomTabBar get 3 tabs', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: BottomTabBar(
              currentIndex: 0,
              onTap: (index) => print(index),
            ),
          ),
        ),
      );
      expect(find.text("All"), findsOneWidget);
      expect(find.text("Complete"), findsOneWidget);
      expect(find.text("Incomplete"), findsOneWidget);
    });
  });
}
