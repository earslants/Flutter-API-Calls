import 'package:flutter/material.dart';
import 'package:harrypotterapi/core/constants/enums/network_route.dart';
import 'package:harrypotterapi/core/init/network/network_manager.dart';
import 'package:harrypotterapi/view/spells/model/spell_model.dart';
import 'package:harrypotterapi/view/spells/service/ISpellsService.dart';

class SpellsService extends ISPellsService {
  BuildContext? context;

  SpellsService({this.context});

  @override
  Future<List<Spell>> fetchSpells() async {
    final query = NetworkRoutes.SPELLS.rawValue;
    final response = await NetworkManager.instance.dioGet(path: query);
    return (response as List).map((json) => Spell().fromJson(json)).toList();
  }
}
