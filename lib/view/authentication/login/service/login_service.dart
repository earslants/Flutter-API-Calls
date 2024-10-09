import 'package:flutter/material.dart';
import 'package:harrypotterapi/view/authentication/login/service/ILoginService.dart';
import 'package:harrypotterapi/view/navigation/view/navigation_view.dart';

import '../model/login_model.dart';

class LoginService extends ILoginService {
  BuildContext? context;

  LoginService({this.context});

  @override
  Future<void> login(LoginModel model) async {
    //TODO Firebase Authentication.
  }

  @override
  Future<bool> checkAuth() async {
    // Just testing. This condition will be (auth.currentUser.uid != null)
    if (true) {
      return true;
    }
    return false;
  }
}
