import 'package:flutter/material.dart';
import 'package:harrypotterapi/core/constants/enums/network_route.dart';
import 'package:harrypotterapi/core/init/network/network_manager.dart';
import 'package:harrypotterapi/view/characters/model/character_model.dart';
import 'package:harrypotterapi/view/characters/service/ICharactersService.dart';

class CharactersService extends ICharactersService {
  BuildContext? context;

  CharactersService({this.context});

  @override
  Future<List<Character>> fetchCharacters() async {
    final query = NetworkRoutes.CHARS.rawValue;
    final response = await NetworkManager.instance.dioGet(path: query);

    // Veriyi List<Character> olarak döndürüyoruz
    return (response as List).map((json) => Character.fromJson(json)).toList();
  }
}
