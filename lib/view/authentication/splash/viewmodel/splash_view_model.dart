import 'package:flutter/material.dart';
import 'package:harrypotterapi/core/base/viewmodel/base_view_model.dart';
import 'package:harrypotterapi/view/authentication/splash/service/ISplashService.dart';
import 'package:harrypotterapi/view/authentication/splash/service/splash_service.dart';

class SplashViewModel extends BaseViewModel with ChangeNotifier {
  ISplashService? splashService;

  @override
  void init() {
    splashService = SplashService(context: myContext);
    checkAuth();
  }

  @override
  void setContext(BuildContext context) => myContext = context;

  void checkAuth() async {
    await splashService!.navigate();
  }
}
