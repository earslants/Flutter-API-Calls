import 'package:flutter/material.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../service/ISplashService.dart';
import '../service/splash_service.dart';

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
