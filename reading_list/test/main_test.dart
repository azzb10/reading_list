import 'package:flutter_test/flutter_test.dart';
import 'package:reading_list/main.dart';
import 'package:reading_list/pages/booklist_page.dart';

void main() {
  testWidgets('My first loaded page is BooklistPage', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(BooklistPage), findsOneWidget);
  });
}
