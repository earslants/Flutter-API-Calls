import 'package:flutter/material.dart';
import '../../../../core/constants/image/default_image_url.dart';
import '../../../../core/constants/texts/app_text_styles.dart';
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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 53,
            child: Stack(
              children: [
                PageView(
                  onPageChanged: (value) => viewModel.setPageIndex(value),
                  controller: viewModel.pageController,
                  children: [
                    buildPageOne(),
                    buildPageTwo(),
                    buildPageThree(),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(dynamicHeight(.01)),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
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
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 47,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: 30, vertical: dynamicHeight(.06)),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        viewModel.getPageTitle(),
                        style: AppTextStyles.headline2,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: dynamicHeight(.02),
                      ),
                      Text(
                        viewModel.getPageContent(),
                        style: AppTextStyles.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          LocaleManager.instance
                              .setBoolValue(PreferencesKeys.IS_FIRST, true);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NavigationView()));
                        },
                        child: Text(
                          "Skip",
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        onPressed: () {
                          if (viewModel.pageIndex == 2) {
                            LocaleManager.instance
                                .setBoolValue(PreferencesKeys.IS_FIRST, true);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NavigationView()));
                          } else {
                            viewModel.incPageIndex();
                          }
                        },
                        child: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center buildPageThree() {
    return Center(
      child: SizedBox(
        height: dynamicHeight(.4),
        width: dynamicWidth(.4),
        child: const Image(
          image: NetworkImage(DefaultImageUrl.HARRY),
        ),
      ),
    );
  }

  Center buildPageTwo() {
    return Center(
      child: SizedBox(
        height: dynamicHeight(.4),
        width: dynamicWidth(.4),
        child: const Image(
          image: NetworkImage(DefaultImageUrl.HARRY),
        ),
      ),
    );
  }

  Center buildPageOne() {
    return Center(
      child: SizedBox(
        height: dynamicHeight(.4),
        width: dynamicWidth(.4),
        child: const Image(
          image: NetworkImage(DefaultImageUrl.HARRY),
        ),
      ),
    );
  }
}
