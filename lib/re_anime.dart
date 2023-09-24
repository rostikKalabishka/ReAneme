import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_anime/router/router.dart';
import 'package:re_anime/screens/auth/auth_screen.dart';
import 'package:re_anime/screens/auth/model/auth_screen_model.dart';
import 'package:re_anime/screens/main_screen/main_screen.dart';
import 'package:re_anime/screens/main_screen/main_screen_model.dart';

import 'package:re_anime/theme/theme.dart';

class ReAnime extends StatelessWidget {
  const ReAnime({super.key});
  static final mainNavigation = MainNavigation();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthScreenModel(), child: const AuthScreen()),
        ChangeNotifierProvider(
            create: (_) => MainScreenModel(), child: const MainScreen())
      ],
      child: MaterialApp(
        onGenerateRoute: mainNavigation.onGenerateRoute,
        // initialRoute: MainNavigationRouteName.auth,
        routes: mainNavigation.routes,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: basicTheme(),
        home: Scaffold(
          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              try {
                if (snapshot.hasData) {
                  log("${snapshot.data?.email}");
                  return const MainScreen();
                } else {
                  return const AuthScreen();
                }
              } catch (e) {
                log("$e");
                return const ScaffoldMessenger(
                  child: Text('Error'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
