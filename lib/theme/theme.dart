import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData basicTheme() => ThemeData(
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor:
            Color.fromARGB(255, 194, 81, 73), // Change to your desired color
      ),
      bottomAppBarTheme: BottomAppBarTheme(color: scaffoldBackgroundColor),
      splashColor: Colors.transparent,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      inputDecorationTheme: const InputDecorationTheme(),
      brightness: Brightness.dark,
      useMaterial3: true,
      primaryColor: primaryColors,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 36),
      ),
    );
