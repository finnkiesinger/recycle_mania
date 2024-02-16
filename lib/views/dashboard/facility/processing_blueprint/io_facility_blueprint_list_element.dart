import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../../models/crafting/io_facility_blueprint.dart';
import '../../../../models/facility/io_facility.dart';
import '../../../../models/util/game_state.dart';
import '../../../util/charge_button.dart';
import '../../../util/smooth_rectangle_border.dart';
import '../../../util/tap_scale.dart';
import '../facility_list_item.dart';
import 'io_facility_blueprint_details.dart';

class IOFacilityBlueprintListElement extends StatelessWidget {
  final IOFacilityBlueprint blueprint;
  const IOFacilityBlueprintListElement({
    super.key,
    required this.blueprint,
  });

  @override
  Widget build(BuildContext context) {
    var facility = blueprint.output as IOFacility;
    var game = context.watch<GameState>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FacilityListItem(
          facility: facility,
          animating: false,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              _ActionButton(
                outline: true,
                icon: Icons.info_rounded,
                text: "MORE",
                color: Colors.white,
                onTap: () {
                  HapticFeedback.lightImpact();
                  showCupertinoModalBottomSheet(
                    context: context,
                    enableDrag: false,
                    isDismissible: false,
                    barrierColor: Colors.black38,
                    duration: const Duration(milliseconds: 250),
                    builder: (context) {
                      return Scaffold(
                        body: IOFacilityBlueprintDetails(
                          blueprint: blueprint,
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(width: 16),
              Expanded(
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
                    hint:
                        "Cost: \$${NumberFormat.decimalPattern(Localizations.localeOf(context).toString()).format(blueprint.cost)}"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function() onTap;
  final bool outline;

  const _ActionButton({
    this.outline = false,
    required this.color,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TapScale(
            onTap: onTap,
            child: Container(
              height: 50,
              decoration: ShapeDecoration(
                shape: SmoothRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  smoothness: 1.0,
                  side: outline
                      ? BorderSide(
                          color: color,
                          width: 2,
                        )
                      : BorderSide.none,
                ),
                color: !outline ? color : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 30,
                    child: Icon(
                      icon,
                      color: outline ? color : Colors.white,
                      size: 30,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: outline ? color : null,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ),
          const Text(""),
        ],
      ),
    );
  }
}
