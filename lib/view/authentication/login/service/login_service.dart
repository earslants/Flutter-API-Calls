import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/app/error_handler.dart';
import '../model/login_model.dart';
import 'ILoginService.dart';

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
      errorTextHandler(e.toString(), context!);
    }
  }

  @override
  Future<void> logOut() async {
    try {
      auth.signOut();
    } catch (e) {
      errorTextHandler("Error", context!);
    }
  }
}
