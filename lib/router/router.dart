import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:re_anime/screens/registration/registration_screen.dart';

import '../screens/auth/auth_screen.dart';
import '../screens/auth/model/auth_screen_model.dart';

import '../screens/forgot_password/forget_password_screen.dart';
import '../screens/main_screen/anime_details/anime_details.dart';
import '../screens/main_screen/anime_details/anime_details_model/anime_details_model.dart';
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
  static const animeDetails = 'main_screen/anime_details';
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

// AnimeDetails
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteName.animeDetails:
        final argument = settings.arguments;
        final animeId = argument is String ? argument : '0';
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider.value(
            value: AnimeDetailsModel(animeId),
            child: const AnimeDetails(),
          ),
        );
      default:
        const widget = Text('Navigator error');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
