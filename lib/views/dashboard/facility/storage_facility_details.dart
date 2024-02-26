import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../data/powerups.dart';
import '../../../models/facility/storage_facility.dart';
import '../../../models/util/game_state.dart';
import '../../util/charge_button.dart';
import '../../util/list_modal.dart';
import 'storage_blueprint/storage_info.dart';

class StorageFacilityDetails extends StatelessWidget {
  final StorageFacility facility;
  const StorageFacilityDetails({
    super.key,
    required this.facility,
  });

  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();
    var blueprint = game.blueprints
        .firstWhere((b) => b.output.runtimeType == facility.runtimeType);

    return ListModal(
      title: facility.name,
      separated: false,
      centered: false,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: StorageInfo(
            blueprint: blueprint,
            showTitle: false,
          ),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const Spacer(),
              const SizedBox(width: 16),
              Expanded(
                  child: ChargeButton(
                chargeColor: const Color.fromARGB(255, 166, 29, 19),
                color: const Color.fromARGB(255, 231, 48, 35),
                onTap: () {
                  Navigator.of(context).pop();
                  HapticFeedback.lightImpact();
                  game.removeFacility(facility);
                },
                chargeTime: 1,
                disabled: false,
                icon: Icons.delete_rounded,
                text: "Demolish",
                hint:
                    "Receive: \$${game.powerups.contains(Powerups.facilitySelling) ? blueprint.cost ~/ 2 : 0}",
              )),
            ],
          ),
        ),
      ],
    );
  }
}
