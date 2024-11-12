import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/preferences_service.dart';

class BookProvider with ChangeNotifier {
  List<Book> _books = [];
  bool _isDarkMode = false;

  List<Book> get books => _books;
  bool get isDarkMode => _isDarkMode;

  void addBook(Book book) {
    _books.add(book);
    notifyListeners();
  }

  void updateBook(Book book) {
    final index = _books.indexWhere((b) => b.id == book.id);
    if (index != -1) {
      _books[index] = book;
      notifyListeners();
    }
  }

  void deleteBook(int id) {
    _books.removeWhere((book) => book.id == id);
    notifyListeners();
  }

  Future<void> loadPreferences() async {
    final prefs = SharedPreferencesService();
    _isDarkMode = await prefs.isDarkMode();
    notifyListeners();
  }

  Future<void> setDarkMode(bool isDarkMode) async {
    _isDarkMode = isDarkMode;
    final prefs = SharedPreferencesService();
    await prefs.setThemeMode(isDarkMode);
    notifyListeners();
  }
}
