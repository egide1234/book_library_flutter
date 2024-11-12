import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _sortingOrderKey = 'sorting_order';
  static const String _isDarkModeKey = 'is_dark_mode';

  Future<void> setSortingOrder(String order) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sortingOrderKey, order);
  }

  Future<String> getSortingOrder() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_sortingOrderKey) ?? 'title'; // Default sorting order
  }

  Future<void> setThemeMode(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isDarkModeKey, isDarkMode);
  }

  Future<bool> isDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isDarkModeKey) ?? false; // Default to light mode
  }
}
