import 'package:flutter/material.dart';
import '../../../core/base/viewmodel/base_view_model.dart';
import '../model/character_model.dart';
import '../service/ICharactersService.dart';
import '../service/characters_service.dart';

class CharactersViewModel extends BaseViewModel with ChangeNotifier {
  List<Character>? characters;
  ICharactersService? charactersService;

  CharactersViewModel({this.characters});

  @override
  void init() {
    charactersService = CharactersService(context: myContext);
    fetchChars();
  }

  @override
  void setContext(BuildContext context) => myContext = context;

  void fetchChars() async {
    try {
      characters = await charactersService!.fetchCharacters();
    } catch (e) {
      print("Error: $e");
    }
    notifyListeners();
  }

  int charsLength() {
    if (characters == null) {
      return 0;
    }
    return characters!.length - 1;
  }
}
