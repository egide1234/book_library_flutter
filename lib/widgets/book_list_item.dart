import 'package:flutter/material.dart';
import '../models/book.dart';
import '../screens/book_detail_screen.dart';

class BookListItem extends StatelessWidget {
  final Book book;

  BookListItem({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
