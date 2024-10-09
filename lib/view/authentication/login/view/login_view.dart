import 'package:flutter/material.dart';
import 'package:harrypotterapi/core/base/state/base_state.dart';
import 'package:harrypotterapi/core/base/view/base_view.dart';
import 'package:harrypotterapi/view/authentication/login/viewmodel/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (LoginViewModel model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) =>
          buildScaffold(context, viewModel),
    );
  }

  Scaffold buildScaffold(BuildContext context, LoginViewModel viewModel) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Padding(
              padding: dynamicPadding(),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      viewModel.login();
                    },
                    child: const Text("Deneme"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
