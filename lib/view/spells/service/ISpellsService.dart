import '../model/spell_model.dart';

abstract class ISPellsService {
  Future<List<Spell>> fetchSpells();
}
