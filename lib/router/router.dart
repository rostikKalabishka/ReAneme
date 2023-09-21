import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_anime/screens/main_screen/search_anime/model/search_model.dart';
import 'package:re_anime/screens/auth/registration/registration_screen.dart';

import '../screens/auth/auth_screen.dart';
import '../screens/main_screen/main_screen.dart';
import '../screens/main_screen/main_screen_model.dart';
import '../screens/main_screen/more_info/more_info_screen.dart';

abstract class MainNavigationRouteName {
  static const auth = 'auth';
  static const mainScreen = '/';

  static const registrationScreen = 'registration';
  static const signUp = 'sign_up';
  // static const account = 'account';
  static const moreInfo = '/more_info';
}

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteName.auth: (context) => const AuthScreen(),
    MainNavigationRouteName.mainScreen: (context) => ChangeNotifierProvider(
        create: (_) => MainScreenModel(), child: const MainScreen()),
    MainNavigationRouteName.registrationScreen: (context) =>
        const RegistrationScreen(),
    MainNavigationRouteName.moreInfo: (context) => ChangeNotifierProvider(
        create: (_) => SearchModel(), child: const MoreInfoWidget())
  };
}
