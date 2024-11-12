import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/book_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Sort by Title'),
            onTap: () {
              // Handle sorting
            },
          ),
          ListTile(
            title: Text('Sort by Author'),
            onTap: () {
              // Handle sorting
            },
          ),
          ListTile(
            title: Text('Sort by Rating'),
            onTap: () {
              // Handle sorting
            },
          ),
          SwitchListTile(
            title: Text('Dark Mode'),
            value: bookProvider.isDarkMode,
            onChanged: (bool value) {
              bookProvider.setDarkMode(value);
            },
          ),
        ],
      ),
    );
  }
}
