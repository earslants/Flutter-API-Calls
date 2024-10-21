import 'package:flutter/material.dart';
import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/init/cache/locale_manager.dart';

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

  String getPageTitle() {
    switch (pageIndex) {
      case 0:
        return "Lorem Ipsum Dolor";
      case 1:
        return "Proin Congue Rhoncus Quam";
      case 2:
        return " Aenean Ut Nisi Tincidunt";
      default:
        return "Morbi Elementum";
    }
  }

  String getPageContent() {
    switch (pageIndex) {
      case 0:
        return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id efficitur lorem. Duis mollis, elit sit amet dapibus auctor, ipsum orci iaculis lectus, at sodales mauris sapien quis nunc";
      case 1:
        return "Nulla accumsan, dui at ultrices ultrices, dui quam tempus metus, id volutpat ante urna ut ligula.";
      case 2:
        return "Quisque id consequat magna. Duis eget massa aliquam, euismod sapien vel, vulputate nulla. Suspendisse potenti";
      default:
        return "Etiam auctor erat urna, a mattis leo congue id. Morbi nec sapien libero";
    }
  }

  @override
  void setContext(BuildContext context) => myContext = context;
}
