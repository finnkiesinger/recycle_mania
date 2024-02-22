import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../models/crafting/io_facility_blueprint.dart';
import '../../../../models/facility/io_facility.dart';
import '../../../../models/facility/processing_facility.dart';
import '../../../util/list_header.dart';
import '../../../util/list_modal.dart';
import '../facility_list_item.dart';

class IOFacilityBlueprintDetails extends StatelessWidget {
  final IOFacilityBlueprint blueprint;
  const IOFacilityBlueprintDetails({
    super.key,
    required this.blueprint,
  });

  IOFacility get facility => blueprint.output as IOFacility;

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
        const Header(text: "Requirements:"),
        const SizedBox(height: 16),
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
                        Row(
                          children: [
                            Text(
                              r.item.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text("\$${r.item.price}"),
                          ],
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
        if (facility is ProcessingFacility)
          CostBreakdown(
            facility: facility as ProcessingFacility,
            blueprint: blueprint,
          ),
      ],
    );
  }
}

class CostBreakdown extends StatelessWidget {
  final ProcessingFacility facility;
  final IOFacilityBlueprint blueprint;
  final bool showConstructionCost;
  const CostBreakdown({
    super.key,
    required this.facility,
    required this.blueprint,
    this.showConstructionCost = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header(text: "Cost Breakdown:"),
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
                      "\$${facility.cost * (facility.time + facility.cooldown)}"),
                ],
              ),
              Row(
                children: [
                  const Text("Waste Acquisition Cost:"),
                  const Spacer(),
                  Text(
                    "\$${facility.inputCost}",
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
                  int totalCost =
                      facility.cost * (facility.time + facility.cooldown) +
                          facility.inputCost;

                  return Row(
                    children: [
                      const Text(
                        "Total Cost per iteration:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "\$$totalCost",
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
