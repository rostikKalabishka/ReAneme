import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:re_anime/domain/services/auth_services.dart';

class ForgetPasswordModel extends ChangeNotifier {
  final _authService = AuthServices();
  Future forgetPassword(BuildContext context, String email) async {
    try {
      await _authService.passwordReset(context, email: email.trim());
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('Password reset link sent! Check your email'),
            );
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }
}
