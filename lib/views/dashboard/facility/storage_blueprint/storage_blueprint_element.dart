import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../models/crafting/storage_facility_blueprint.dart';
import '../../../../models/util/game_state.dart';
import '../../../util/charge_button.dart';
import 'storage_info.dart';

class StorageBlueprintElement extends StatelessWidget {
  final StorageFacilityBlueprint blueprint;

  const StorageBlueprintElement({
    super.key,
    required this.blueprint,
  });

  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          StorageInfo(blueprint: blueprint),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 150,
                child: ChargeButton(
                  icon: Icons.build_circle_rounded,
                  text: "BUILD",
                  color: const Color.fromARGB(255, 0, 163, 95),
                  chargeColor: const Color.fromARGB(255, 0, 114, 67),
                  disabled: !game.fulfillsRequirementsFor(blueprint),
                  onTap: () {
                    game.buildFacility(blueprint);
                    HapticFeedback.lightImpact();
                    Navigator.pop(context);
                  },
                  chargeTime: 1.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
