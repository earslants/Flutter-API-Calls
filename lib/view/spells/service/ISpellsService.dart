import 'package:harrypotterapi/view/spells/model/spell_model.dart';

abstract class ISPellsService {
  Future<List<Spell>> fetchSpells();
}
