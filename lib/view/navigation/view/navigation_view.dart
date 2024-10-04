import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:harrypotterapi/core/base/state/base_state.dart';
import 'package:harrypotterapi/core/base/view/base_view.dart';
import 'package:harrypotterapi/view/navigation/viewmodel/navigation_view_model.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: Text(viewModel.title),
      ),
      body: viewModel.body,
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        activeIcon: Icons.close,
        activeBackgroundColor: Colors.deepPurpleAccent,
        activeForegroundColor: Colors.white,
        visible: true,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        elevation: 8.0,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.star),
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
            label: 'Spells',
            labelStyle: const TextStyle(fontSize: 18.0),
          ),
          SpeedDialChild(
            child: const Icon(Icons.person),
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
            label: 'Characters',
            labelStyle: const TextStyle(fontSize: 18.0),
          ),
          SpeedDialChild(
            child: const Icon(Icons.star),
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
            label: 'Staffs',
            labelStyle: const TextStyle(fontSize: 18.0),
          ),
        ],
        child: const Text("Wiki"),
      ),
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
