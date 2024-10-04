import 'package:flutter/material.dart';
import 'package:harrypotterapi/core/base/state/base_state.dart';
import 'package:harrypotterapi/core/base/view/base_view.dart';
import 'package:harrypotterapi/core/constants/image/default_image_url.dart';
import 'package:harrypotterapi/view/characters/viewmodel/characters_view_model.dart';

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
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.charsLength(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: .1),
                      borderRadius: BorderRadius.circular(8),
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
                                    Text(
                                        "Name: ${viewModel.characters?[index].name}"),
                                    Text(
                                        "Species: ${viewModel.characters?[index].species}"),
                                    Text(
                                        "House: ${viewModel.characters?[index].house}"),
                                    Expanded(
                                      child: Text(
                                        "Actor: ${viewModel.characters?[index].actor}",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
