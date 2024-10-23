import 'package:flutter/material.dart';

import '../../../core/init/network/network_manager.dart';
import '../model/character_model.dart';
import 'ICharactersService.dart';

class CharactersService extends ICharactersService {
  BuildContext? context;

  CharactersService({this.context});

  @override
  Future<List<Character>> fetchCharacters(String query) async {
    final response = await NetworkManager.instance.dioGet(path: query);

    return (response as List)
        .map((json) => Character().fromJson(json))
        .toList();
  }
}
