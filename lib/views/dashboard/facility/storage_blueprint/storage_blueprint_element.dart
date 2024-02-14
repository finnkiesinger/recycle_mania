import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../models/crafting/storage_facility_blueprint.dart';
import '../../../../models/facility/storage_facility.dart';
import '../../../../models/item/item.dart';
import '../../../../models/item/product.dart';
import '../../../../models/item/resource.dart';
import '../../../../models/util/game_state.dart';
import '../../../util/charge_button.dart';

class StorageBlueprintElement extends StatelessWidget {
  final StorageFacilityBlueprint blueprint;

  const StorageBlueprintElement({
    super.key,
    required this.blueprint,
  });

  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();

    var facility = blueprint.output as StorageFacility;
    Item item = facility.item;

    Widget icon;

    if (item.icon.icon != null) {
      icon = Icon(
        item.icon.icon,
        color: Colors.white,
        size: 32,
      );
    } else {
      icon = item.icon.widget!;
    }

    Color color = Colors.black;

    if (item is Resource) {
      color = item.color;
    } else if (item is Product) {
      color = item.color ?? color;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${item.name} Storage",
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text(
                      "Construction Cost:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "\$${blueprint.cost}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text(
                      "Operating Cost:",
                      style: TextStyle(fontSize: 18),
                    ),
                    const Spacer(),
                    Text("\$${facility.cost}/s"),
                  ],
                ),
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
          ),
        ],
      ),
    );
  }
}
