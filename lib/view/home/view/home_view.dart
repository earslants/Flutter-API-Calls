import 'package:flutter/material.dart';
import 'package:harrypotterapi/core/base/state/base_state.dart';
import 'package:harrypotterapi/core/base/view/base_view.dart';
import 'package:harrypotterapi/view/home/viewmodel/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (HomeViewModel model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewModel) =>
          buildScaffold(context, viewModel),
    );
  }

  Scaffold buildScaffold(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      body: viewModel.body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.pageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Characters'),
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Houses'),
        ],
        onTap: (value) {
          viewModel.setPageIndex(value);
          print(viewModel.pageIndex);
        },
      ),
    );
  }
}
