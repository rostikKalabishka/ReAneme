import 'package:flutter/material.dart';
import 'package:re_anime/screens/auth/auth_screen.dart';

class ReAnime extends StatelessWidget {
  const ReAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SafeArea(
        child: AuthScreen(),
      ),
    );
  }
}
