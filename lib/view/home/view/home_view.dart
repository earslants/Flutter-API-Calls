import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/base/view/base_view.dart';
import '../../authentication/login/viewmodel/login_view_model.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
      backgroundColor: Colors.white,
      appBar: buildAppBar(viewModel),
      body: viewModel.body,
      bottomNavigationBar: buildNavigationBar(viewModel),
    );
  }

  AppBar buildAppBar(HomeViewModel viewModel) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(viewModel.title!),
      actions: [
        Consumer<LoginViewModel>(
          builder: (context, viewModel, child) {
            return IconButton(
              onPressed: () async {
                viewModel.logOut();
              },
              icon: const Icon(Icons.logout),
            );
          },
        ),
      ],
    );
  }

  BottomNavigationBar buildNavigationBar(HomeViewModel viewModel) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      currentIndex: viewModel.pageIndex!,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Characters'),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Spells'),
      ],
      onTap: (value) => viewModel.setPageIndex(value),
    );
  }
}
