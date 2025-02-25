import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list_app/main.dart';

void main() {
  testWidgets('To-Do List App Smoke Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(TodoListApp());

    // Verify that the app starts with the correct title.
    expect(find.text('To-Do List'), findsOneWidget);

    // Verify that the initial state has no tasks.
    expect(find.byType(ListTile), findsNothing);

    // Enter a task in the text field and press the "Add" button.
    await tester.enterText(find.byType(TextField), 'Buy groceries');
    await tester.tap(find.text('Add'));
    await tester.pump(); // Rebuild the widget after the state change.

    // Verify that the task is added to the list.
    expect(find.text('Buy groceries'), findsOneWidget);
    expect(find.byType(ListTile), findsOneWidget);

    // Tap the delete button to remove the task.
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump(); // Rebuild the widget after the state change.

    // Verify that the task is removed from the list.
    expect(find.text('Buy groceries'), findsNothing);
    expect(find.byType(ListTile), findsNothing);
  });
}
