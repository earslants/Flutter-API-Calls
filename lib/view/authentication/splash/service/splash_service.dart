import 'package:flutter/material.dart';
import 'package:harrypotterapi/core/constants/enums/locale_keys_enum.dart';
import 'package:harrypotterapi/core/init/cache/locale_manager.dart';
import 'package:harrypotterapi/view/authentication/onboard/view/onboard_view.dart';

import '../../../navigation/view/navigation_view.dart';
import 'ISplashService.dart';

class SplashService extends ISplashService {
  BuildContext? context;
  SplashService({this.context});

  @override
  Future<void> navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    if (LocaleManager.instance.getBoolValue(PreferencesKeys.IS_FIRST)) {
      Navigator.pushReplacement(context!,
          MaterialPageRoute(builder: (context) => const OnboardView()));
      return;
    }
    Navigator.push(context!,
        MaterialPageRoute(builder: (context) => const NavigationView()));
  }
}
