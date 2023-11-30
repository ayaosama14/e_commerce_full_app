import 'package:flutter/material.dart';

ThemeData apptheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      color: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black),
    ),
  );
}
