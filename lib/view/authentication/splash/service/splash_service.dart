import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../login/view/login_view.dart';
import 'ISplashService.dart';
import '../../../navigation/view/navigation_view.dart';

class SplashService extends ISplashService {
  BuildContext? context;
  FirebaseAuth auth = FirebaseAuth.instance;

  SplashService({this.context});

  @override
  Future<void> navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    if (auth.currentUser?.uid != null) {
      Navigator.push(context!,
          MaterialPageRoute(builder: (context) => const NavigationView()));
      return;
    }
    Navigator.push(
        context!, MaterialPageRoute(builder: (context) => const LoginView()));
  }
}
