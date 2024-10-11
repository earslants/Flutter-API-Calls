import 'package:flutter/material.dart';

import '../../../core/base/viewmodel/base_view_model.dart';
import '../service/INavigationService.dart';
import '../service/navigation_service.dart';

class NavigationViewModel extends BaseViewModel with ChangeNotifier {
  bool? _isAuth;
  bool? get isAuth => _isAuth;

  INavigationService? navigationService;

  NavigationViewModel({this.navigationService});

  @override
  void init() {
    _isAuth = false;
    navigationService = NavigationService(context: myContext);
    checkAuth();
  }

  @override
  void setContext(BuildContext context) => myContext = context;

  void checkAuth() async {
    _isAuth = await navigationService!.checkAuth();
    notifyListeners();
  }
}
