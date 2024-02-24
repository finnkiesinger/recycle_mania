import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/crafting/storage_facility_blueprint.dart';
import '../../../../models/util/game_state.dart';
import '../../../util/empty_list_placeholder.dart';
import '../../../util/list_modal.dart';
import 'storage_blueprint_element.dart';

class StorageBlueprintList extends StatefulWidget {
  const StorageBlueprintList({super.key});

  @override
  State<StorageBlueprintList> createState() => _StorgeBlueprintListState();
}

class _StorgeBlueprintListState extends State<StorageBlueprintList> {
  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();
    var blueprints =
        game.blueprints.whereType<StorageFacilityBlueprint>().toList();
    return ListModal(
      title: "Blueprints",
      placeholder: const EmptyBlueprintListPlaceholder(),
      children: blueprints
          .map(
            (blueprint) => StorageBlueprintElement(blueprint: blueprint),
          )
          .toList(),
    );
  }
}
