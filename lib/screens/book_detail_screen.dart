import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  BookDetailScreen({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Author: ${book.author}', style: TextStyle(fontSize: 18)),
            Text('Rating: ${book.rating}', style: TextStyle(fontSize: 18)),
            Text('Read: ${book.isRead ? 'Yes' : 'No'}', style: TextStyle(fontSize: 18)), // Updated to use isRead
          ],
        ),
      ),
    );
  }
}
