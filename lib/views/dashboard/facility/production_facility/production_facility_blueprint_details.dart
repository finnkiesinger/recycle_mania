import 'package:flutter/material.dart';

import '../../../../models/crafting/production_facility_blueprint.dart';
import '../../../../models/facility/production_facility.dart';
import '../../../util/list_header.dart';
import '../../../util/list_modal.dart';
import '../facility_list_item.dart';

class ProductionFacilityBlueprintDetails extends StatelessWidget {
  final ProductionFacilityBlueprint blueprint;
  const ProductionFacilityBlueprintDetails({
    super.key,
    required this.blueprint,
  });

  ProductionFacility get facility => blueprint.output as ProductionFacility;

  @override
  Widget build(BuildContext context) {
    return ListModal(
      title: facility.name,
      centered: false,
      separated: false,
      children: [
        if (blueprint.description != null) ...[
          const Header(text: "Description:"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              blueprint.description!,
              style: const TextStyle(
                color: Colors.white60,
              ),
            ),
          ),
        ],
        const Header(text: "Pipeline:"),
        FacilityListItem(
          facility: facility,
          hideTitle: true,
          animating: false,
          collapsed: true,
        ),
        const SizedBox(height: 16),
        ProfitBreakdown(
          blueprint: blueprint,
          facility: facility,
        ),
      ],
    );
  }
}

class ProfitBreakdown extends StatelessWidget {
  final ProductionFacilityBlueprint blueprint;
  final ProductionFacility facility;
  final bool showConstructionCost;

  const ProfitBreakdown({
    super.key,
    required this.blueprint,
    required this.facility,
    this.showConstructionCost = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header(text: "Profit Breakdown:"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showConstructionCost) ...[
                Row(
                  children: [
                    const Text("Construction Cost:"),
                    const Spacer(),
                    Text("\$${blueprint.cost}"),
                  ],
                ),
                const SizedBox(height: 24.0),
              ],
              Row(
                children: [
                  const Text("Operating Cost (per iteration):"),
                  const Spacer(),
                  Text(
                      "-\$${facility.cost * (facility.time + facility.cooldown)}"),
                ],
              ),
              Row(
                children: [
                  const Text("Revenue:"),
                  const Spacer(),
                  Text(
                    "\$${facility.profit}",
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    color: Colors.white54,
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  int profit =
                      -facility.cost * (facility.time + facility.cooldown) +
                          facility.profit;

                  return Row(
                    children: [
                      const Text(
                        "Profit:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "\$$profit",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
