import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../data/blueprints.dart';
import '../../../../models/crafting/processing_facility_blueprint.dart';
import '../../../util/smooth_rectangle_border.dart';
import '../../../util/tap_scale.dart';
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
    var blueprints =
        Blueprints.all.whereType<ProcessingFacilityBlueprint>().toList();

    return Stack(
      children: [
        ListView.separated(
          padding: EdgeInsets.zero.copyWith(
            bottom: 86 + MediaQuery.of(context).viewPadding.bottom,
            top: 56,
          ),
          itemCount: blueprints.length,
          separatorBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: Center(
                child: Container(
                  height: 2,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
            );
          },
          itemBuilder: (context, index) {
            var bp = blueprints[index];
            return IOFacilityBlueprintListElement(
              blueprint: bp,
            );
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
            child: const Center(
              child: Text(
                "Blueprints",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  height: 1,
                ),
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
                Navigator.of(context).pop();
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
                        color: const Color.fromARGB(255, 50, 50, 50),
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
