import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../models/crafting/storage_facility_blueprint.dart';
import '../../../../models/util/game_state.dart';
import '../../../util/smooth_rectangle_border.dart';
import '../../../util/tap_scale.dart';
import 'storage_blueprint_element.dart';

class StorageBlueprintList extends StatefulWidget {
  const StorageBlueprintList({super.key});

  @override
  State<StorageBlueprintList> createState() => _StorgeBlueprintListState();
}

class _StorgeBlueprintListState extends State<StorageBlueprintList> {
  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();
    var blueprints =
        game.blueprints.whereType<StorageFacilityBlueprint>().toList();
    return Stack(
      children: [
        ListView.separated(
          padding: EdgeInsets.only(
            top: 32,
            bottom: MediaQuery.of(context).viewPadding.bottom + 200,
          ),
          itemBuilder: (context, index) {
            return StorageBlueprintElement(
              blueprint: blueprints[index],
            );
          },
          separatorBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
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
        Padding(
          padding: EdgeInsets.only(
            bottom: 16 + MediaQuery.of(context).viewPadding.bottom,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: TapScale(
              onTap: () {
                Navigator.of(context).pop();
                HapticFeedback.lightImpact();
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
          ),
        )
      ],
    );
  }
}
