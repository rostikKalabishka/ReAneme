import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:re_anime/domain/services/auth_services.dart';

import '../../../router/router.dart';

class RegistrationModels extends ChangeNotifier {
  final authServices = AuthServices();
  TextEditingController? passwordEditingController;
  TextEditingController? emailEditingController;

  Future<String?> registration(
      BuildContext context, String email, String password) async {
    if (email != null &&
        email.isNotEmpty &&
        password != null &&
        password.isNotEmpty) {
      return await authServices
          .registration(email: email, password: password)
          .then((value) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            MainNavigationRouteName.mainScreen, (route) => false);
      });
    }
  }
}
