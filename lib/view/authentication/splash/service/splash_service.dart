import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:harrypotterapi/view/home/view/home_view.dart';
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
    Navigator.push(context!,
        MaterialPageRoute(builder: (context) => const NavigationView()));
  }
}
