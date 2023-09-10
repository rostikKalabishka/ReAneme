import 'package:flutter/material.dart';
import 'package:re_anime/screens/registration/registration_screen.dart';

import '../screens/auth/auth_screen.dart';
import '../screens/main_screen/main_screen.dart';

abstract class MainNavigationRouteName {
  static const auth = '/';
  static const mainScreen = '/mainScreen';
  // static const movieDetails = '/movie_details';
  // static const movieTrailer = '/movie_details/trailer';
  // static const seriesTrailer = '/series_details/trailer';
  // static const seriesDetails = '/series_details';
  // static const resendEmail = 'resend_email';
  static const registrationScreen = 'registration';
  static const signUp = 'sign_up';
  static const account = '/account';
}

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteName.auth: (context) => const AuthScreen(),
    MainNavigationRouteName.mainScreen: (context) => const MainScreen(),
    MainNavigationRouteName.registrationScreen: (context) =>
        const RegistrationScreen()
  };
}
