import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:re_anime/screens/registration/registration_screen.dart';

import '../screens/auth/auth_screen.dart';
import '../screens/auth/model/auth_screen_model.dart';

import '../screens/forgot_password/forget_password_screen.dart';
import '../screens/main_screen/more_info/model_more_info/more_info_model.dart';
import '../screens/registration/registration_models/registration_models.dart';
import '../screens/main_screen/main_screen.dart';

import '../screens/main_screen/more_info/more_info_screen.dart';

abstract class MainNavigationRouteName {
  static const auth = 'auth';
  static const mainScreen = 'main_screen';
  static const forgetPassword = 'auth/forget_password';
  static const registrationScreen = 'registration';
  static const signUp = 'sign_up';
  // static const account = 'account';
  static const moreInfo = 'main_screen/more_info';
}

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteName.auth: (context) => ChangeNotifierProvider(
        create: (_) => AuthScreenModel(), child: const AuthScreen()),
    MainNavigationRouteName.mainScreen: (context) => const MainScreen(),
    MainNavigationRouteName.registrationScreen: (context) =>
        ChangeNotifierProvider(
            create: (_) => RegistrationModels(),
            child: const RegistrationScreen()),
    MainNavigationRouteName.moreInfo: (context) => ChangeNotifierProvider(
          child: const MoreInfoWidget(),
          create: (_) => MoreInfoModel(),
        ),
    MainNavigationRouteName.forgetPassword: (context) =>
        const ForgetPasswordScreen(),
  };
}
