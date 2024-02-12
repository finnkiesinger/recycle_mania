import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../data/blueprints.dart';
import '../../../models/crafting/processing_facility_blueprint.dart';
import '../../../models/facility/processing_facility.dart';
import '../../util/modal_stack.dart';
import '../../util/smooth_rectangle_border.dart';
import '../../util/tap_scale.dart';

class ProcessingBlueprintList extends StatefulWidget {
  const ProcessingBlueprintList({super.key});

  @override
  State<ProcessingBlueprintList> createState() =>
      _ProcessingBlueprintListState();
}

class _ProcessingBlueprintListState extends State<ProcessingBlueprintList> {
  @override
  Widget build(BuildContext context) {
    var blueprints =
        Blueprints.all.whereType<ProcessingFacilityBlueprint>().toList();
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
            bottom: 86 + MediaQuery.of(context).viewPadding.bottom,
            top: 56,
          ),
          itemCount: blueprints.length,
          itemBuilder: (context, index) {
            var bp = blueprints[index];
            var facility = bp.output as ProcessingFacility;

            return Text(facility.name);
          },
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
            child: const Text(
              "Blueprints",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24,
                height: 1,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(
              bottom: MediaQuery.of(context).viewPadding.bottom + 16,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
                  Theme.of(context).scaffoldBackgroundColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [
                  0.0,
                  0.4,
                ],
              ),
            ),
            child: TapScale(
              onTap: () {
                ModalStack.of(context).pop();
                HapticFeedback.lightImpact();
              },
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: ShapeDecoration(
                        shape: SmoothRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          smoothness: 1.0,
                        ),
                        color: const Color(0xFF3C3C3C),
                      ),
                      child: const Center(
                        child: Text(
                          "CLOSE",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
