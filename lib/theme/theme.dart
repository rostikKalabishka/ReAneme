import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData basicTheme() => ThemeData(
      inputDecorationTheme: InputDecorationTheme(),
      brightness: Brightness.dark,
      useMaterial3: true,
      primaryColor: primaryColors,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 36),
      ),
    );
