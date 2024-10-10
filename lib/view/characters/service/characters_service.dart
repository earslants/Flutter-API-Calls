import 'package:flutter/material.dart';
import '../../../core/constants/enums/network_route.dart';
import '../../../core/init/network/network_manager.dart';
import '../model/character_model.dart';
import 'ICharactersService.dart';

class CharactersService extends ICharactersService {
  BuildContext? context;

  CharactersService({this.context});

  @override
  Future<List<Character>> fetchCharacters() async {
    final query = NetworkRoutes.CHARS.rawValue;
    final response = await NetworkManager.instance.dioGet(path: query);

    // Veriyi List<Character> olarak döndürüyoruz
    return (response as List)
        .map((json) => Character().fromJson(json))
        .toList();
  }
}
