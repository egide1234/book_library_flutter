import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.orange, // Replaces `accentColor`
    ),
    // Define additional theme properties if needed
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    colorScheme: ColorScheme.dark(
      primary: Colors.blueGrey,
      secondary: Colors.deepOrange, // Replaces `accentColor`
    ),
    // Define additional theme properties if needed
  );
}
