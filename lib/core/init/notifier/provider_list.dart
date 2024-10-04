import 'package:harrypotterapi/view/characters/viewmodel/characters_view_model.dart';
import 'package:harrypotterapi/view/home/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../view/authentication/login/viewmodel/login_view_model.dart';

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
    ChangeNotifierProvider(create: (context) => HomeViewModel()),
  ];
}
