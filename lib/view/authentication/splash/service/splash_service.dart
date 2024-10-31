import 'package:flutter/material.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../../../../core/init/cache/locale_manager.dart';
import 'ISplashService.dart';

class SplashService extends ISplashService {
  BuildContext? context;
  SplashService({this.context});

  @override
  Future<void> navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!LocaleManager.instance.getBoolValue(PreferencesKeys.IS_FIRST)) {
      // Navigator.pushReplacement(context!,
      //     MaterialPageRoute(builder: (context) => const OnboardView()));
      NavigationService.instance
          .navigateToPageClear(path: NavigationConstants.ONBOARD);
      return;
    }
    // Navigator.push(context!,
    //     MaterialPageRoute(builder: (context) => const NavigationView()));
    NavigationService.instance
        .navigateToPage(path: NavigationConstants.NAVIGATONVIEW);
  }
}
