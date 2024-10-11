import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'INavigationService.dart';

class NavigationService extends INavigationService {
  BuildContext? context;
  FirebaseAuth auth = FirebaseAuth.instance;

  NavigationService({this.context});

  @override
  Future<bool> checkAuth() async {
    if (auth.currentUser?.uid != null) {
      return true;
    }
    return false;
  }
}
