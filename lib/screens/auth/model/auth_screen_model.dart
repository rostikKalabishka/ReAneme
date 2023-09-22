import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:re_anime/theme/constants.dart';

import '../../../domain/services/auth_services.dart';
import '../../../router/router.dart';

class AuthScreenModel extends ChangeNotifier {
  final _authServices = AuthServices();

  Future<String?> login(
      BuildContext context, String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      final message = await _authServices.login(
          email: email.trim(), password: password.trim());

      if (message!.contains('Success')) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            MainNavigationRouteName.mainScreen, (route) => false);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: scaffoldMessenger,
          content: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }
}
