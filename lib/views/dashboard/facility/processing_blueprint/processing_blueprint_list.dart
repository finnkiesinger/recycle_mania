import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/crafting/processing_facility_blueprint.dart';
import '../../../../models/util/game_state.dart';
import '../../../util/empty_list_placeholder.dart';
import '../../../util/list_modal.dart';
import 'io_facility_blueprint_list_element.dart';

class ProcessingBlueprintList extends StatefulWidget {
  const ProcessingBlueprintList({super.key});

  @override
  State<ProcessingBlueprintList> createState() =>
      _ProcessingBlueprintListState();
}

class _ProcessingBlueprintListState extends State<ProcessingBlueprintList> {
  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();
    var blueprints =
        game.blueprints.whereType<ProcessingFacilityBlueprint>().toList();

    return ListModal(
        title: "Blueprints",
        placeholder: const EmptyBlueprintListPlaceholder(),
        children: blueprints
            .map(
              (blueprint) =>
                  IOFacilityBlueprintListElement(blueprint: blueprint),
            )
            .toList());
  }
}
