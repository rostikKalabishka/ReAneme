import 'package:flutter/material.dart';

import '../../../domain/services/auth_services.dart';
import '../../../router/router.dart';

class AuthScreenModel extends ChangeNotifier {
  final _authServices = AuthServices();

  Future<String?> login(
      BuildContext context, String email, String password) async {
    if (email != null &&
        email.isNotEmpty &&
        password != null &&
        password.isNotEmpty) {
      _authServices.login(email: email, password: password).then((value) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            MainNavigationRouteName.mainScreen, (route) => false);
      });
    }
  }
}
