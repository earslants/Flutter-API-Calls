import 'package:harrypotterapi/view/characters/model/character_model.dart';

abstract class ICharactersService {
  Future<List<Character>> fetchCharacters();
}
