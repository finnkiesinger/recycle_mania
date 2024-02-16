import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../models/crafting/production_facility_blueprint.dart';
import '../../../../models/util/game_state.dart';
import '../../../util/smooth_rectangle_border.dart';
import '../../../util/tap_scale.dart';
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
    return Stack(
      children: [
        ListView.separated(
          padding: EdgeInsets.zero.copyWith(
            bottom: 86 + MediaQuery.of(context).viewPadding.bottom,
            top: 56,
          ),
          itemBuilder: (context, index) {
            var blueprint = blueprints[index];
            return ProductionFacilityBlueprintElement(
              blueprint: blueprint,
            );
          },
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
          itemCount: blueprints.length,
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
                  0.7,
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
        )
      ],
    );
  }
}
