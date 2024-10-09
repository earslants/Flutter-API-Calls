import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:harrypotterapi/view/authentication/login/service/ILoginService.dart';

import '../model/login_model.dart';

class LoginService extends ILoginService {
  BuildContext? context;
  FirebaseAuth auth = FirebaseAuth.instance;
  LoginService({this.context});

  @override
  Future<void> login(LoginModel model) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: model.email!, password: model.password!);
    } catch (e) {
      print("Auth Error: $e");
    }
  }
}
