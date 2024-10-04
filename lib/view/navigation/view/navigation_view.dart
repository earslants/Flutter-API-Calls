import 'package:flutter/material.dart';
import 'package:harrypotterapi/core/base/state/base_state.dart';
import 'package:harrypotterapi/core/base/view/base_view.dart';
import 'package:harrypotterapi/view/navigation/viewmodel/navigation_view_model.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends BaseState<NavigationView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<NavigationViewModel>(
      viewModel: NavigationViewModel(),
      onModelReady: (NavigationViewModel model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, NavigationViewModel viewModel) =>
          buildScaffold(context, viewModel),
    );
  }

  Scaffold buildScaffold(BuildContext context, NavigationViewModel viewModel) {
    return Scaffold(
      body: viewModel.body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.pageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Characters'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Spells'),
        ],
        onTap: (value) {
          viewModel.setPageIndex(value);
        },
      ),
    );
  }
}
