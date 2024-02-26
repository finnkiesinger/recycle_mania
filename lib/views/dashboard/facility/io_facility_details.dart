import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../data/powerups.dart';
import '../../../models/crafting/processing_facility_blueprint.dart';
import '../../../models/crafting/production_facility_blueprint.dart';
import '../../../models/facility/io_facility.dart';
import '../../../models/facility/processing_facility.dart';
import '../../../models/facility/production_facility.dart';
import '../../../models/util/game_state.dart';
import '../../util/charge_button.dart';
import '../../util/list_header.dart';
import '../../util/list_modal.dart';
import 'facility_list_item.dart';
import 'processing_blueprint/io_facility_blueprint_details.dart';
import 'production_facility/production_facility_blueprint_details.dart';

class IOFacilityDetails extends StatelessWidget {
  final IOFacility facility;
  const IOFacilityDetails({
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
      centered: true,
      children: [
        const Header(
          text: "Description",
          top: false,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            blueprint.description ?? "",
            style: const TextStyle(
              color: Colors.white60,
            ),
          ),
        ),
        const Header(text: "Pipeline:"),
        FacilityListItem(
          facility: facility,
          hideTitle: true,
          animating: false,
          collapsed: true,
        ),
        const Header(
          text: "Components",
        ),
        const SizedBox(height: 12),
        ...blueprint.requirements.mapIndexed(
          (i, r) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ).copyWith(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 237, 138, 0),
                    ),
                    child: Center(
                      child: Text(
                        "${i + 1}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          r.item.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          r.item.description ?? "",
                          style: const TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
        if (blueprint is ProcessingFacilityBlueprint)
          CostBreakdown(
            facility: facility as ProcessingFacility,
            blueprint: blueprint,
            showConstructionCost: false,
          ),
        if (blueprint is ProductionFacilityBlueprint)
          ProfitBreakdown(
            facility: facility as ProductionFacility,
            blueprint: blueprint,
            showConstructionCost: false,
          ),
        const SizedBox(height: 64),
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
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
