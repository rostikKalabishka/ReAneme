import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData basicTheme() => ThemeData(
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      inputDecorationTheme: const InputDecorationTheme(),
      brightness: Brightness.dark,
      useMaterial3: true,
      primaryColor: primaryColors,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 36),
      ),
    );
