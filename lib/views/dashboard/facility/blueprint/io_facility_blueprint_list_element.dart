import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../models/crafting/io_facility_blueprint.dart';
import '../../../../models/facility/io_facility.dart';
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
              _ActionButton(
                  icon: Icons.build_circle_rounded,
                  text: "BUILD",
                  color: const Color.fromARGB(255, 0, 163, 95),
                  onTap: () {},
                  hint:
                      "Cost: \$${NumberFormat.decimalPattern(Localizations.localeOf(context).toString()).format(blueprint.cost)}"),
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
  final String hint;

  const _ActionButton({
    this.outline = false,
    required this.color,
    required this.icon,
    required this.text,
    required this.onTap,
    this.hint = "",
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TapScale(
            onTap: onTap,
            child: Container(
              height: 44,
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
          Text(
            hint,
            style: TextStyle(
              color: Colors.white38,
            ),
          ),
        ],
      ),
    );
  }
}
