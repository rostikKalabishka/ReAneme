import 'package:flutter/material.dart';
import 'package:re_anime/router/router.dart';

import 'package:re_anime/screens/auth/auth_screen.dart';

class ReAnime extends StatelessWidget {
  const ReAnime({super.key});
  static final mainNavigation = MainNavigation();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainNavigationRouteName.auth,
      routes: mainNavigation.routes,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
