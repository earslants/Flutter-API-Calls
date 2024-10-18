import 'package:flutter/material.dart';
import 'package:harrypotterapi/core/base/state/base_state.dart';
import 'package:harrypotterapi/core/base/view/base_view.dart';
import 'package:harrypotterapi/core/constants/app/dropdownItems.dart';
import 'package:harrypotterapi/core/constants/enums/network_route.dart';
import 'package:harrypotterapi/view/characters/view/characters_view.dart';
import 'package:harrypotterapi/view/characters/viewmodel/characters_view_model.dart';
import 'package:harrypotterapi/view/home/view/home_view.dart';
import 'package:provider/provider.dart';

class CharsDrawer extends StatefulWidget {
  const CharsDrawer({super.key});

  @override
  State<CharsDrawer> createState() => _CharsDrawerState();
}

class _CharsDrawerState extends BaseState<CharsDrawer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CharactersViewModel>(
      builder: (context, viewModel, child) {
        return Drawer(
          child: SafeArea(
            child: Padding(
              padding: dynamicPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Filter Options",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: dynamicHeight(.04)),
                  DropdownButton<String>(
                    hint: const Text("Select House"),
                    isExpanded: true,
                    value: viewModel.dropdownValue == ""
                        ? null
                        : viewModel.dropdownValue,
                    items: Dropdownitems.items,
                    onChanged: (value) => viewModel.setDropdownValue(value),
                  ),
                  SizedBox(height: dynamicHeight(.04)),
                  InkWell(
                    onTap: () {
                      if (viewModel.dropdownValue != null) {
                        viewModel.initializeService(context);
                        viewModel.setQuery(NetworkRoutes.HOUSES.rawValue
                            .replaceAll(
                                "{HOUSENAME}", viewModel.dropdownValue!));
                        viewModel.fetchChars(viewModel.query);
                        print(viewModel.characters);
                        viewModel.setIsFiltered(true);
                        Scaffold.of(context).closeDrawer();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: dynamicPadding(),
                        child: const Text(
                          "Filter",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/*
- Gryffindor
- Ravenclaw
- Hufflepuff
- Slytherin
*/