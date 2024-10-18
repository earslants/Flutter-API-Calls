import 'package:flutter/material.dart';
import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../viewmodel/onboard_view_model.dart';
import '../../../navigation/view/navigation_view.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends BaseState<OnboardView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardViewModel>(
        viewModel: OnboardViewModel(),
        onModelReady: (OnboardViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, OnboardViewModel viewModel) =>
            buildScaffold(context, viewModel));
  }

  Scaffold buildScaffold(BuildContext context, OnboardViewModel viewModel) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              Container(
                height: dynamicHeight(.5),
                width: dynamicWidth(1),
                color: Colors.blue,
                child: PageView(
                  onPageChanged: (value) => viewModel.setPageIndex(value),
                  controller: viewModel.pageController,
                  children: const [
                    Center(child: Text("Page 1")),
                    Center(child: Text("Page 2")),
                    Center(child: Text("Page 3")),
                  ],
                ),
              ),
              SizedBox(height: dynamicHeight(.02)),
              SizedBox(
                height: 10,
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: viewModel.pageIndex == index
                              ? Colors.red
                              : Colors.blue.shade300,
                          shape: BoxShape.circle,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: dynamicHeight(.04)),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: dynamicWidth(.01),
                      vertical: dynamicHeight(.02),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: viewModel.pageIndex != 0,
                          child: IconButton(
                            onPressed: () {
                              viewModel.decPageIndex();
                            },
                            icon: Row(
                              children: [
                                const Icon(Icons.arrow_back_ios),
                                SizedBox(
                                  width: dynamicWidth(.01),
                                ),
                                const Text("Previous"),
                              ],
                            ),
                          ),
                        ),
                        viewModel.pageIndex == 2
                            ? IconButton(
                                onPressed: () {
                                  LocaleManager.instance.setBoolValue(
                                      PreferencesKeys.IS_FIRST, true);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NavigationView()));
                                },
                                icon: Row(
                                  children: [
                                    const Text("Let's Start"),
                                    SizedBox(width: dynamicWidth(.01)),
                                    const Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              )
                            : IconButton(
                                onPressed: () {
                                  viewModel.incPageIndex();
                                },
                                icon: Row(
                                  children: [
                                    const Text("Next"),
                                    SizedBox(
                                      width: dynamicWidth(.01),
                                    ),
                                    const Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
