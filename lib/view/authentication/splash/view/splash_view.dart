import 'package:flutter/material.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseState<SplashView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (SplashViewModel model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel viewModel) =>
          buildScaffold(),
    );
  }

  Scaffold buildScaffold() {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: dynamicHeight(1),
            width: dynamicWidth(1),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 197, 197, 197),
                  Colors.grey,
                  Color.fromARGB(255, 116, 116, 116),
                  Color.fromARGB(255, 58, 58, 58),
                  Color.fromARGB(255, 22, 22, 22),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          const Center(
            child: Text(
              "Welcome!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
