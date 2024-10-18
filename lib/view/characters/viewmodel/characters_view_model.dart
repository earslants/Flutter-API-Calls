import 'package:flutter/material.dart';

import '../../../core/base/viewmodel/base_view_model.dart';
import '../../../core/constants/enums/network_route.dart';
import '../model/character_model.dart';
import '../service/ICharactersService.dart';
import '../service/characters_service.dart';

class CharactersViewModel extends BaseViewModel with ChangeNotifier {
  List<Character>? characters;
  ICharactersService? charactersService;

  bool _isFiltered = false;
  bool get isFiltered => _isFiltered;

  final String _defaultQuery = NetworkRoutes.CHARS.rawValue;
  String get defaultQuery => _defaultQuery;
  String _query = NetworkRoutes.CHARS.rawValue;
  String get query => _query;

  String? _dropdownValue = "";
  String? get dropdownValue => _dropdownValue;
  CharactersViewModel({this.characters});

  @override
  void init() {
    charactersService = CharactersService(context: myContext);
    fetchChars(_query);
  }

  @override
  void setContext(BuildContext context) => myContext = context;

  void fetchChars(String query) async {
    try {
      characters = await charactersService!.fetchCharacters(query);
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

  void setQuery(String newQuery) {
    _query = newQuery;
    notifyListeners();
  }

  void setDropdownValue(String? value) {
    _dropdownValue = value;
    notifyListeners();
  }

  void initializeService(BuildContext context) {
    charactersService ??= CharactersService(context: context);
  }

  void setCharacters() {
    characters = [];
    notifyListeners();
  }

  void setIsFiltered(bool value) {
    _isFiltered = value;
    notifyListeners();
  }
}
