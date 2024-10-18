import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../view/authentication/login/viewmodel/login_view_model.dart';
import '../../../view/authentication/onboard/viewmodel/onboard_view_model.dart';
import '../../../view/authentication/splash/viewmodel/splash_view_model.dart';
import '../../../view/characters/viewmodel/characters_view_model.dart';
import '../../../view/home/viewmodel/home_view_model.dart';
import '../../../view/navigation/viewmodel/navigation_view_model.dart';
import '../../../view/spells/viewmodel/spells_view_model.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (context) => LoginViewModel()),
    ChangeNotifierProvider(create: (context) => CharactersViewModel()),
    ChangeNotifierProvider(create: (context) => SpellsViewModel()),
    ChangeNotifierProvider(create: (context) => SplashViewModel()),
    ChangeNotifierProvider(create: (context) => HomeViewModel()),
    ChangeNotifierProvider(create: (context) => NavigationViewModel()),
    ChangeNotifierProvider(create: (context) => OnboardViewModel()),
  ];
}
