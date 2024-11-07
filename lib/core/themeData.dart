// Light theme
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.blue,
  secondaryHeaderColor: Colors.amber,
  // Add other theme configurations for light mode here
);

// Dark theme
final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey,
    secondaryHeaderColor: Colors.deepOrange,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
    )
    // Add other theme configurations for dark mode here
    );
