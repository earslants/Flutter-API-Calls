import 'package:flutter/material.dart';
import 'package:harrypotterapi/view/authentication/login/viewmodel/login_view_model.dart';
import 'package:harrypotterapi/view/home/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../../core/base/view/base_view.dart';

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
        automaticallyImplyLeading: false,
        title: Text(viewModel.title!),
        actions: [
          Consumer<LoginViewModel>(
            builder: (context, viewModel, child) {
              return IconButton(
                  onPressed: () {}, icon: const Icon(Icons.logout));
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
