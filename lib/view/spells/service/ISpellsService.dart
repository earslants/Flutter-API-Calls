// ignore_for_file: file_names

import '../model/spell_model.dart';

abstract class ISPellsService {
  Future<List<Spell>> fetchSpells();
}
