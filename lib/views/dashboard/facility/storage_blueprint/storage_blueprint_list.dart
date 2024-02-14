import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/util/game_state.dart';

class StorgeBlueprintList extends StatefulWidget {
  const StorgeBlueprintList({super.key});

  @override
  State<StorgeBlueprintList> createState() => _StorgeBlueprintListState();
}

class _StorgeBlueprintListState extends State<StorgeBlueprintList> {
  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();
    var blueprints =
        game.blueprints.whereType<StorageFacilityBlueprint>().toList();
    return;
  }
}
