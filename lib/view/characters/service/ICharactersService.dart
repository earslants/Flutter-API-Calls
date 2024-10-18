// ignore_for_file: file_names

import '../model/character_model.dart';

abstract class ICharactersService {
  Future<List<Character>> fetchCharacters(String query);
}
