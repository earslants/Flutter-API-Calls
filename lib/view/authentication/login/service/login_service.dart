import 'package:flutter/material.dart';
import 'package:harrypotterapi/view/authentication/login/service/ILoginService.dart';

import '../model/login_model.dart';

class LoginService extends ILoginService {
  BuildContext? context;

  LoginService({this.context});

  @override
  Future<void> login(LoginModel model) async {}
}
