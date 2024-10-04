import 'package:flutter/material.dart';
import 'package:harrypotterapi/core/constants/app/app_constants.dart';
import 'package:harrypotterapi/core/init/cache/locale_manager.dart';

abstract class BaseViewModel {
  late BuildContext myContext;
  void setContext(BuildContext context);
  void init();
}

abstract class BaseNetworkManager {
  late BuildContext buildContext;
  String BASE_URL = ApplicationConstants.BASE_URL;

  LocaleManager localeManager = LocaleManager.instance;
  void setContext(BuildContext buildContext);
}
