import 'package:flutter/material.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_view.dart';
import '../viewmodel/spells_view_model.dart';

class SpellsView extends StatefulWidget {
  const SpellsView({super.key});

  @override
  State<SpellsView> createState() => _SpellsViewState();
}

class _SpellsViewState extends BaseState<SpellsView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SpellsViewModel>(
        viewModel: SpellsViewModel(),
        onModelReady: (SpellsViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, SpellsViewModel viewModel) =>
            buildPage(context, viewModel));
  }

  Widget buildPage(BuildContext context, SpellsViewModel viewModel) {
    if (viewModel.spells == null) {
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
                itemCount: viewModel.spellsLength(),
                itemBuilder: (context, index) {
                  return buildSpellCard(viewModel, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildSpellCard(SpellsViewModel viewModel, int index) {
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
            offset: const Offset(0, 3), // changes position of shadow
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
                const SizedBox(
                  height: 80,
                  width: 80,
                  // Add spell icon
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image(
                      image: AssetImage("images/spell.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Spell: ${viewModel.spells?[index].name}"),
                      Text(
                        "Description: ${viewModel.spells?[index].description}",
                        maxLines: 3,
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
