import 'package:flutter/material.dart';
import 'package:harrypotterapi/core/base/viewmodel/base_view_model.dart';

import '../../characters/view/characters_view.dart';
import '../../spells/view/spells_view.dart';

class HomeViewModel extends BaseViewModel with ChangeNotifier {
  int? pageIndex;
  Widget? body;
  String? title;

  @override
  void init() {
    pageIndex = 0;
    body = const CharactersView();
    title = "Characters";
  }

  @override
  void setContext(BuildContext context) => myContext = context;

  void setPageIndex(int value) {
    pageIndex = value;
    setBody();
    setTitle();
    notifyListeners();
  }

  void setBody() {
    if (pageIndex == 0) {
      body = const CharactersView();
    } else if (pageIndex == 1) {
      body = const SpellsView();
    }
  }

  void setTitle() {
    if (pageIndex == 0) {
      title = "Characters";
    } else if (pageIndex == 1) {
      title = "Spells";
    }
  }
}
