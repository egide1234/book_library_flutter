import 'package:flutter/material.dart';
import '../models/book.dart';

class BookForm extends StatefulWidget {
  final Book? book;

  BookForm({Key? key, this.book}) : super(key: key);

  @override
  _BookFormState createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _author;
  late int _rating;
  late bool _isRead;

  @override
  void initState() {
    super.initState();
    if (widget.book != null) {
      _title = widget.book!.title;
      _author = widget.book!.author;
      _rating = widget.book!.rating;
      _isRead = widget.book!.isRead;
    } else {
      _title = '';
      _author = '';
      _rating = 0;
      _isRead = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: _title,
              decoration: InputDecoration(labelText: 'Title'),
              onSaved: (value) => _title = value!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            TextFormField(
              initialValue: _author,
              decoration: InputDecoration(labelText: 'Author'),
              onSaved: (value) => _author = value!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an author';
                }
                return null;
              },
            ),
            TextFormField(
              initialValue: _rating.toString(),
              decoration: InputDecoration(labelText: 'Rating'),
              keyboardType: TextInputType.number,
              onSaved: (value) => _rating = int.parse(value!),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a rating';
                }
                return null;
              },
            ),
            Row(
              children: [
                Text('Read'),
                Checkbox(
                  value: _isRead,
                  onChanged: (value) {
                    setState(() {
                      _isRead = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text(widget.book == null ? 'Add Book' : 'Update Book'),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final book = Book(
        id: widget.book?.id ?? DateTime.now().millisecondsSinceEpoch, // Unique ID
        title: _title,
        author: _author,
        rating: _rating,
        isRead: _isRead,
      );
      Navigator.pop(context, book);
    }
  }
}
