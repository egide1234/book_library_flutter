import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/add_edit_book_screen.dart';
import 'screens/book_detail_screen.dart';
import 'screens/settings_screen.dart';
import 'models/book.dart'; // Ensure you import the Book model

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Library',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/addEditBook':
            return MaterialPageRoute(
              builder: (context) => AddEditBookScreen(),
            );
          case '/settings':
            return MaterialPageRoute(
              builder: (context) => SettingsScreen(),
            );
          case '/bookDetail':
            final Book? book = settings.arguments as Book?;
            if (book == null) {
              return MaterialPageRoute(
                builder: (context) => ErrorScreen(), // Provide a fallback screen
              );
            }
            return MaterialPageRoute(
              builder: (context) => BookDetailScreen(book: book),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => HomeScreen(),
            );
        }
      },
    );
  }
}
