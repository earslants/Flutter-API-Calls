import 'package:flutter/material.dart';
import '../../../core/components/app/error_handler.dart';
import '../../../core/base/viewmodel/base_view_model.dart';
import '../service/ISpellsService.dart';
import '../service/spells_service.dart';

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
      errorTextHandler("Error", myContext);
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
