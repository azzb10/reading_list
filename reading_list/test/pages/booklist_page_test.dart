import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reading_list/pages/add_book_page.dart';
import 'package:reading_list/pages/booklist_page.dart';
import 'package:reading_list/widgets/booklist.dart';

void main() {
  testWidgets('Booklist inits without any book', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: BooklistPage(),
      ),
    );
    expect(find.byType(Booklist), findsOneWidget);
    expect(find.byType(ListTile), findsNothing);
  });

  testWidgets('Navigate to AddBookPage after click on add button',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: BooklistPage(),
      ),
    );
    final addButton = find.byType(FloatingActionButton);
    expect(addButton, findsOneWidget);

    await tester.tap(addButton);
    await tester.pumpAndSettle();
    expect(find.byType(AddBookPage), findsOneWidget);
  });
}
