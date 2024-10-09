import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harrypotterapi/core/base/state/base_state.dart';
import 'package:harrypotterapi/core/base/view/base_view.dart';
import 'package:harrypotterapi/core/components/auth/my_text_field.dart';
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
          buildPage(context, viewModel),
    );
  }

  GestureDetector buildPage(BuildContext context, LoginViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        viewModel.usernameFocus.unfocus();
        viewModel.passwordFocus.unfocus();
      },
      child: Scaffold(
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
                    MyTextField(
                      focusNode: viewModel.usernameFocus,
                      controller: viewModel.emailController!,
                      hintText: "E-mail",
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(
                        CupertinoIcons.mail_solid,
                      ),
                    ),
                    MyTextField(
                      focusNode: viewModel.passwordFocus,
                      controller: viewModel.passwordController!,
                      hintText: "Password",
                      obscureText: viewModel.isVisible,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(
                        CupertinoIcons.lock_fill,
                      ),
                      suffixIcon: IconButton(
                        onPressed: viewModel.setIsVisible,
                        icon: viewModel.isVisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        viewModel.login();
                      },
                      child: const Text("Log In"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
