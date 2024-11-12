

import 'package:flutter_test/flutter_test.dart';
import 'package:book_library/models/book.dart';
import 'package:book_library/providers/book_provider.dart';

void main() {
  group('BookProvider', () {
    late BookProvider bookProvider;

    setUp(() {
      bookProvider = BookProvider();
    });

    test('initial state is correct', () {
      expect(bookProvider.books, []);
      expect(bookProvider.isDarkMode, false);
    });

    test('addBook adds a book to the list', () {
      final book = Book(id: 1, title: 'Test Book', author: 'Test Author', rating: 5, isRead: false);
      bookProvider.addBook(book);

      expect(bookProvider.books.length, 1);
      expect(bookProvider.books.first.title, 'Test Book');
    });

    test('updateBook updates a book in the list', () {
      final book = Book(id: 1, title: 'Test Book', author: 'Test Author', rating: 5, isRead: false);
      bookProvider.addBook(book);

      final updatedBook = Book(id: 1, title: 'Updated Book', author: 'Test Author', rating: 4, isRead: true);
      bookProvider.updateBook(updatedBook);

      expect(bookProvider.books.length, 1);
      expect(bookProvider.books.first.title, 'Updated Book');
      expect(bookProvider.books.first.rating, 4);
      expect(bookProvider.books.first.isRead, true);
    });

    test('deleteBook removes a book from the list', () {
      final book = Book(id: 1, title: 'Test Book', author: 'Test Author', rating: 5, isRead: false);
      bookProvider.addBook(book);

      bookProvider.deleteBook(1);

      expect(bookProvider.books.length, 0);
    });

    test('setDarkMode updates the theme mode', () {
      bookProvider.setDarkMode(true);
      expect(bookProvider.isDarkMode, true);
    });

    // Additional provider tests can be added here.
  });
}
