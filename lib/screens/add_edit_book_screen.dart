import 'package:flutter/material.dart';
import '../models/book.dart';

class AddEditBookScreen extends StatefulWidget {
  final Book? book;

  AddEditBookScreen({Key? key, this.book}) : super(key: key);

  @override
  _AddEditBookScreenState createState() => _AddEditBookScreenState();
}

class _AddEditBookScreenState extends State<AddEditBookScreen> {
  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late int _rating;
  late bool _isRead;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.book?.title ?? '');
    _authorController = TextEditingController(text: widget.book?.author ?? '');
    _rating = widget.book?.rating ?? 0;
    _isRead = widget.book?.isRead ?? false;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book == null ? 'Add Book' : 'Edit Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _authorController,
              decoration: InputDecoration(labelText: 'Author'),
            ),
            DropdownButton<int>(
              value: _rating,
              onChanged: (int? newValue) {
                setState(() {
                  _rating = newValue ?? 0;
                });
              },
              items: [1, 2, 3, 4, 5].map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              hint: Text('Rating'),
            ),
            SwitchListTile(
              title: Text('Read'),
              value: _isRead,
              onChanged: (bool value) {
                setState(() {
                  _isRead = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final book = Book(
                  id: widget.book?.id ?? 0,
                  title: _titleController.text,
                  author: _authorController.text,
                  rating: _rating,
                  isRead: _isRead,
                );
                // Save or update the book
                // Add your save logic here, e.g., call a method from BookProvider or DatabaseHelper
              },
              child: Text(widget.book == null ? 'Add Book' : 'Update Book'),
            ),
          ],
        ),
      ),
    );
  }
}
