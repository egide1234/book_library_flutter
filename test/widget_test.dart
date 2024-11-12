import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:book_library/main.dart';
import 'package:book_library/providers/book_provider.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('HomeScreen displays a list of books', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BookProvider()),
        ],
        child: MyApp(),
      ),
    );

    expect(find.text('Book Library'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('Add book button navigates to AddEditBookScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BookProvider()),
        ],
        child: MyApp(),
      ),
    );

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.text('Add Book'), findsOneWidget);
  });

  testWidgets('Settings button navigates to SettingsScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BookProvider()),
        ],
        child: MyApp(),
      ),
    );

    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();

    expect(find.text('Settings'), findsOneWidget);
  });
}
