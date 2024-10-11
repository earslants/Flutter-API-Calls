import 'package:flutter/material.dart';
import '../../authentication/login/view/login_view.dart';
import '../../authentication/login/viewmodel/login_view_model.dart';
import '../../home/view/home_view.dart';
import '../../../core/base/view/base_view.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (LoginViewModel model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) =>
          buildPage(context, viewModel),
    );
  }

  Widget buildPage(BuildContext context, LoginViewModel viewModel) {
    if (viewModel.isAuth) {
      return const HomeView();
    }
    return const LoginView();
  }
}
