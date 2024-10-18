import 'package:flutter/material.dart';
import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/constants/app/dropdownItems.dart';
import '../../../core/constants/enums/network_route.dart';
import '../../../core/constants/image/default_image_url.dart';
import '../viewmodel/characters_view_model.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends BaseState<CharactersView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<CharactersViewModel>(
      viewModel: CharactersViewModel(),
      onModelReady: (CharactersViewModel model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, CharactersViewModel viewModel) =>
          buildPage(context, viewModel),
    );
  }

  Widget buildPage(BuildContext context, CharactersViewModel viewModel) {
    if (viewModel.characters == null) {
      return const Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(),
        ),
      );
    }
    return SafeArea(
      child: Padding(
        padding: dynamicPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  hint: const Text("Select House"),
                  value: viewModel.dropdownValue == ""
                      ? null
                      : viewModel.dropdownValue,
                  items: Dropdownitems.items,
                  onChanged: (value) {
                    viewModel.setDropdownValue(value);
                    viewModel.setQuery(NetworkRoutes.HOUSES.rawValue
                        .replaceAll("{HOUSENAME}", viewModel.dropdownValue!));
                    viewModel.fetchChars(viewModel.query);
                  },
                ),
                Visibility(
                  visible: viewModel.dropdownValue != "",
                  child: TextButton(
                    onPressed: () {
                      viewModel.setDropdownValue("");
                      viewModel.fetchChars(viewModel.defaultQuery);
                      viewModel.setIsFiltered(false);
                    },
                    child: const Text("Reset Filter"),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.charsLength(),
                itemBuilder: (context, index) {
                  return buildCharacterCard(viewModel, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildCharacterCard(CharactersViewModel viewModel, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: .5),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network(
                    viewModel.characters?[index].image == ""
                        ? DefaultImageUrl.URL
                        : viewModel.characters?[index].image ??
                            DefaultImageUrl.URL,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: ${viewModel.characters?[index].name}"),
                      Text("Species: ${viewModel.characters?[index].species}"),
                      Text("House: ${viewModel.characters?[index].house}"),
                      Text(
                        "Actor: ${viewModel.characters?[index].actor}",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios))
        ],
      ),
    );
  }
}
