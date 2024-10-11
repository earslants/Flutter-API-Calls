import 'package:flutter/material.dart';

import '../../../navigation/view/navigation_view.dart';
import 'ISplashService.dart';

class SplashService extends ISplashService {
  BuildContext? context;
  SplashService({this.context});

  @override
  Future<void> navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.push(context!,
        MaterialPageRoute(builder: (context) => const NavigationView()));
  }
}
