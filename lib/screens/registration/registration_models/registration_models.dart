import 'package:flutter/material.dart';
import 'package:re_anime/domain/services/auth_services.dart';

import '../../../router/router.dart';
import '../../../theme/constants.dart';

class RegistrationModels extends ChangeNotifier {
  final authServices = AuthServices();

  final _authServices = AuthServices();

  Future<String?> registration(
      BuildContext context, String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      final message = await _authServices.registration(
          email: email.trim(), password: password.trim());

      if (message!.contains('Success')) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            MainNavigationRouteName.mainScreen, (route) => false);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: scaffoldMessenger,
          content: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    }
    return 'biba';
  }
}
