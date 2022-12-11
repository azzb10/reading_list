import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reading_list/pages/add_book_page.dart';
import 'package:reading_list/pages/booklist_page.dart';

void main() {
  testWidgets(
    'Render fields correctly',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AddBookPage(
            onSubmit: (book) {},
          ),
        ),
      );
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.byType(Checkbox), findsOneWidget);
    },
  );

  testWidgets(
    'validator check',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: BooklistPage(),
        ),
      );
      final addButton = find.byType(FloatingActionButton);
      await tester.tap(addButton);
      await tester.pumpAndSettle();

      final title = find.byType(TextFormField).first;
      expect(title, findsOneWidget);

      final description = find.byType(TextFormField).last;
      expect(description, findsOneWidget);
      await tester.enterText(description, 'any description');

      final submitButton = find.byType(ElevatedButton);
      expect(submitButton, findsOneWidget);
      await tester.tap(submitButton);
      await tester.pumpAndSettle();

      expect(find.text('Please type a title'), findsOneWidget);
      expect(find.byType(BooklistPage), findsNothing);
    },
  );

  testWidgets(
    'Update booklist when submit form',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: BooklistPage(),
        ),
      );
      final addButton = find.byType(FloatingActionButton);
      await tester.tap(addButton);
      await tester.pumpAndSettle();

      final title = find.byType(TextFormField).first;
      expect(title, findsOneWidget);
      await tester.enterText(title, 'any title');

      final description = find.byType(TextFormField).last;
      expect(description, findsOneWidget);
      await tester.enterText(description, 'any description');

      final submitButton = find.byType(ElevatedButton);
      expect(submitButton, findsOneWidget);
      await tester.tap(submitButton);

      await tester.pumpAndSettle();
      expect(find.byType(BooklistPage), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);
    },
  );

  testWidgets(
    'Delete book',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: BooklistPage(),
        ),
      );
      final addButton = find.byType(FloatingActionButton);
      await tester.tap(addButton);
      await tester.pumpAndSettle();

      final title = find.byType(TextFormField).first;
      expect(title, findsOneWidget);
      await tester.enterText(title, 'any title');

      final description = find.byType(TextFormField).last;
      expect(description, findsOneWidget);
      await tester.enterText(description, 'any description');

      final submitButton = find.byType(ElevatedButton);
      expect(submitButton, findsOneWidget);
      await tester.tap(submitButton);

      await tester.pumpAndSettle();
      expect(find.byType(BooklistPage), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);

      final deleteButton = find.byIcon(Icons.delete_forever).first;
      expect(deleteButton, findsOneWidget);
      await tester.tap(deleteButton);
      await tester.pumpAndSettle();

      expect(find.byType(ListTile), findsNothing);
    },
  );
}
