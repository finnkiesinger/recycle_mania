import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/crafting/storage_facility_blueprint.dart';
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
    return ListView.separated(
      itemBuilder: (context, index) {
        return Container();
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: Center(
            child: Container(
              height: 2,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
          ),
        );
      },
      itemCount: blueprints.length,
    );
  }
}
