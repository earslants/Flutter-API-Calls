import 'package:flutter/material.dart';

import '../../../core/constants/enums/network_route.dart';
import '../../../core/init/network/network_manager.dart';
import '../model/spell_model.dart';
import 'ISpellsService.dart';

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
