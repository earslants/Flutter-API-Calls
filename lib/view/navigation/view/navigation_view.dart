import 'package:flutter/material.dart';
import 'package:harrypotterapi/view/authentication/login/view/login_view.dart';
import 'package:harrypotterapi/view/home/view/home_view.dart';
import 'package:harrypotterapi/view/navigation/viewmodel/navigation_view_model.dart';

import '../../../core/base/view/base_view.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<NavigationViewModel>(
      viewModel: NavigationViewModel(),
      onModelReady: (NavigationViewModel model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, NavigationViewModel viewModel) =>
          buildPage(context, viewModel),
    );
  }

  Widget buildPage(BuildContext context, NavigationViewModel viewModel) {
    if (viewModel.isAuth!) {
      return const HomeView();
    }
    return const LoginView();
  }
}
