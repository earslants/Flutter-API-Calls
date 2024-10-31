import 'package:flutter/material.dart';
import '../../../view/authentication/onboard/view/onboard_view.dart';
import '../../../view/navigation/view/navigation_view.dart';

import '../../../view/authentication/login/view/login_view.dart';
import '../../../view/authentication/splash/view/splash_view.dart';
import '../../../view/home/view/home_view.dart';
import '../../components/app/not_found_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView(), NavigationConstants.DEFAULT);
      case NavigationConstants.LOGIN:
        return normalNavigate(const LoginView(), NavigationConstants.LOGIN);
      case NavigationConstants.HOMEPAGE:
        return normalNavigate(const HomeView(), NavigationConstants.HOMEPAGE);
      case NavigationConstants.ONBOARD:
        return normalNavigate(const OnboardView(), NavigationConstants.ONBOARD);
      case NavigationConstants.NAVIGATONVIEW:
        return normalNavigate(
            const NavigationView(), NavigationConstants.NAVIGATONVIEW);
      default:
        return notFoundNavigate();
    }
  }

  MaterialPageRoute notFoundNavigate() => MaterialPageRoute(
        builder: (context) => const NotFoundView(),
      );

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName),
    );
  }
}
