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
      NavigationService.instance
          .navigateToPageClear(path: NavigationConstants.ONBOARD);
      return;
    }
    NavigationService.instance
        .navigateToPage(path: NavigationConstants.NAVIGATONVIEW);
  }
}
