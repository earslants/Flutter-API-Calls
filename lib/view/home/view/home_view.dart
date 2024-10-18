import 'package:flutter/material.dart';
import 'package:harrypotterapi/core/components/app/chars_drawer.dart';
import 'package:harrypotterapi/view/characters/viewmodel/characters_view_model.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(viewModel.title!),
        actions: [
          Consumer<LoginViewModel>(
            builder: (context, viewModel, child) {
              return IconButton(
                onPressed: () async {
                  print(viewModel.isAuth);
                  viewModel.logOut();
                },
                icon: const Icon(Icons.logout),
              );
            },
          ),
        ],
      ),
      body: viewModel.body,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: viewModel.pageIndex!,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Characters'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Spells'),
        ],
        onTap: (value) => viewModel.setPageIndex(value),
      ),
    );
  }
}
