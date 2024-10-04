import 'package:flutter/material.dart';
import 'package:harrypotterapi/core/base/viewmodel/base_view_model.dart';
import 'package:harrypotterapi/view/spells/service/ISpellsService.dart';
import 'package:harrypotterapi/view/spells/service/spells_service.dart';

import '../model/spell_model.dart';

class SpellsViewModel extends BaseViewModel with ChangeNotifier {
  List<Spell>? spells;
  ISPellsService? spellsService;

  SpellsViewModel({this.spells});

  @override
  void init() {
    spellsService = SpellsService(context: myContext);
    fetchSpells();
  }

  @override
  void setContext(BuildContext context) => myContext = context;

  void fetchSpells() async {
    try {
      spells = await spellsService!.fetchSpells();
    } catch (e) {
      // TODO Add pop-up message view for error.
      print("Error $e");
    }
    notifyListeners();
  }

  int spellsLength() {
    if (spells == null) {
      return 0;
    }
    return spells!.length - 1;
  }
}
