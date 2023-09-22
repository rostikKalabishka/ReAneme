import 'package:flutter/material.dart';
import 'package:re_anime/domain/services/auth_services.dart';

import '../../../../router/router.dart';

class MoreInfoModel extends ChangeNotifier {
  final _authServices = AuthServices();
  Future<void> logout(BuildContext context) async {
    await _authServices.singOut().then((value) => {
          Navigator.of(context).pushNamedAndRemoveUntil(
              MainNavigationRouteName.auth, (route) => false)
        });
  }
}
