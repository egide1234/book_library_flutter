import 'package:flutter/material.dart';
import '../models/book.dart';
import '../screens/book_detail_screen.dart';
import '../providers/book_provider.dart'; // Ensure this import is correct
import 'package:provider/provider.dart'; // Ensure this import is correct

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    final books = bookProvider.books; // Fetch books from the provider

    return Scaffold(
      appBar: AppBar(
        title: Text('Book Library'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text(book.author),
            trailing: Icon(book.isRead ? Icons.check_circle : Icons.circle), // Use isRead here
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailScreen(book: book),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
