import 'package:flutter/material.dart';
import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../service/ISplashService.dart';
import '../service/splash_service.dart';

class SplashViewModel extends BaseViewModel with ChangeNotifier {
  ISplashService? splashService;

  @override
  Future<void> init() async {
    await LocaleManager.prefrencesInit();
    splashService = SplashService(context: myContext);
    navigate();
  }

  @override
  void setContext(BuildContext context) => myContext = context;

  void navigate() async {
    await splashService!.navigate();
  }
}
