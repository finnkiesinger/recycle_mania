import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/crafting/production_facility_blueprint.dart';
import '../../../../models/util/game_state.dart';
import '../../../util/empty_list_placeholder.dart';
import '../../../util/list_modal.dart';
import 'production_facility_blueprint_element.dart';

class ProductionFacilityBlueprintList extends StatelessWidget {
  const ProductionFacilityBlueprintList({super.key});

  @override
  Widget build(BuildContext context) {
    var blueprints = context
        .watch<GameState>()
        .blueprints
        .whereType<ProductionFacilityBlueprint>()
        .toList();

    return ListModal(
      title: "Blueprints",
      placeholder: const EmptyBlueprintListPlaceholder(),
      children: blueprints
          .map(
            (blueprint) =>
                ProductionFacilityBlueprintElement(blueprint: blueprint),
          )
          .toList(),
    );
  }
}
