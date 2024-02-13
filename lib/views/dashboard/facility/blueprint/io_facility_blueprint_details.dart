import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../models/crafting/io_facility_blueprint.dart';
import '../../../../models/facility/io_facility.dart';
import '../../../../models/facility/processing_facility.dart';
import '../../../util/smooth_rectangle_border.dart';
import '../../../util/tap_scale.dart';
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
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.zero.copyWith(
            top: 40,
            bottom: 140 + MediaQuery.of(context).viewPadding.bottom,
          ),
          children: [
            if (blueprint.description != null) ...[
              const _Header(text: "Description:"),
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
            const _Header(text: "Pipeline:"),
            FacilityListItem(
              facility: facility,
              hideTitle: true,
              animating: false,
              collapsed: true,
            ),
            const _Header(text: "Requirements:"),
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
              _CostBreakdown(
                facility: facility as ProcessingFacility,
                blueprint: blueprint,
              )
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [
                  0.6,
                  1.0,
                ],
              ),
            ),
            child: Text(
              facility.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                height: 1,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewPadding.bottom + 16),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TapScale(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: ShapeDecoration(
                      shape: SmoothRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        smoothness: 1.0,
                        side: const BorderSide(
                          color: Color(0xFF888888),
                          width: 2,
                        ),
                      ),
                      color: const Color.fromARGB(255, 50, 50, 50),
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: Color(0xFF888888),
                      size: 42,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final String text;
  const _Header({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}

class _CostBreakdown extends StatelessWidget {
  final ProcessingFacility facility;
  final IOFacilityBlueprint blueprint;
  const _CostBreakdown({
    required this.facility,
    required this.blueprint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Header(text: "Cost Breakdown:"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text("Construction Cost:"),
                  const Spacer(),
                  Text("\$${blueprint.cost}"),
                ],
              ),
              const SizedBox(height: 24.0),
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
