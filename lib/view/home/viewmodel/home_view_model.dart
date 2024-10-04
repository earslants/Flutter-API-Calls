import 'package:flutter/material.dart';
import 'package:harrypotterapi/core/base/viewmodel/base_view_model.dart';
import 'package:harrypotterapi/view/characters/view/characters_view.dart';
import 'package:harrypotterapi/view/home/view/home_view.dart';

class HomeViewModel extends BaseViewModel with ChangeNotifier {
  int pageIndex = 1;
  Widget body = Container();

  @override
  void init() {
    pageIndex = 1;
  }

  @override
  void setContext(BuildContext context) => myContext = context;

  void setPageIndex(int value) {
    pageIndex = value;
    setBody();
    notifyListeners();
  }

  void setBody() {
    if (pageIndex == 0) {
      body = const CharactersView();
    } else if (pageIndex == 1) {
      body = Container();
    } else if (pageIndex == 2) {
      body = Container(
        child: const Text("Houses View"),
      );
    }
  }
}
