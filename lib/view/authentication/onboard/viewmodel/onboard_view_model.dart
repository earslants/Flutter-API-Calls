import 'package:flutter/material.dart';
import 'package:harrypotterapi/core/base/viewmodel/base_view_model.dart';
import 'package:harrypotterapi/core/init/cache/locale_manager.dart';

class OnboardViewModel extends BaseViewModel with ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  PageController? pageController = PageController();

  @override
  Future<void> init() async {
    await LocaleManager.prefrencesInit();
  }

  void incPageIndex() {
    if (_pageIndex != 2) {
      _pageIndex += 1;
      pageController!.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
    notifyListeners();
  }

  void decPageIndex() {
    if (_pageIndex != 0) {
      _pageIndex -= 1;
      pageController!.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
    notifyListeners();
  }

  void setPageIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }

  @override
  void setContext(BuildContext context) => myContext = context;
}
