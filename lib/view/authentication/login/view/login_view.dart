import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/auth/my_text_field.dart';
import '../viewmodel/login_view_model.dart';

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
      onModelReady: (LoginViewModel model) async {
        model.setContext(context);
        await model.init(); // `init` metodunun tamamlanmasını bekliyoruz.
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
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                  // TODO App Logo
                  ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: dynamicPadding(),
                child: Column(
                  children: [
                    SizedBox(height: dynamicHeight(.03)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildMailField(viewModel),
                        SizedBox(height: dynamicHeight(.02)),
                        buildPasswordField(viewModel),
                        SizedBox(height: dynamicHeight(.01)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: viewModel.rememberMe,
                                  onChanged: (value) =>
                                      viewModel.setRememberMe(value),
                                ),
                                const Text("Remember Me"),
                              ],
                            ),
                            TextButton(
                              onPressed: () async {
                                viewModel.login();
                                // LocaleManager.instance.clearAllSaveFirst();
                              },
                              child: const Text("Log In"),
                            ),
                          ],
                        ),
                      ],
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

  MyTextField buildPasswordField(LoginViewModel viewModel) {
    return MyTextField(
      focusNode: viewModel.passwordFocus,
      controller: viewModel.passwordController!,
      hintText: "Password",
      obscureText: !viewModel.isVisible,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: const Icon(
        CupertinoIcons.lock_fill,
      ),
      suffixIcon: IconButton(
        onPressed: viewModel.setIsVisible,
        icon: !viewModel.isVisible
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
      ),
    );
  }

  MyTextField buildMailField(LoginViewModel viewModel) {
    return MyTextField(
      focusNode: viewModel.usernameFocus,
      controller: viewModel.emailController!,
      hintText: "E-mail",
      obscureText: false,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: const Icon(
        CupertinoIcons.mail_solid,
      ),
    );
  }
}
