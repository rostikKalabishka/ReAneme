import 'package:flutter/foundation.dart';
import 'package:re_anime/domain/services/auth_services.dart';

class ProfileModel extends ChangeNotifier {
  final _authServices = AuthServices();
  String? user;

  Future<void> getUser() async {
    // user = await _authServices.user;
  }
}
