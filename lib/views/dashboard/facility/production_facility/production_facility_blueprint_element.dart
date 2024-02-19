import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../../../../models/crafting/production_facility_blueprint.dart';
import '../../../../models/facility/production_facility.dart';
import '../../../../models/util/game_state.dart';
import '../../../util/action_button.dart';
import '../../../util/charge_button.dart';
import '../facility_list_item.dart';
import 'production_facility_blueprint_details.dart';

class ProductionFacilityBlueprintElement extends StatelessWidget {
  final ProductionFacilityBlueprint blueprint;
  const ProductionFacilityBlueprintElement({
    super.key,
    required this.blueprint,
  });

  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();
    var facility = blueprint.output as ProductionFacility;

    return Column(
      children: [
        FacilityListItem(
          facility: facility,
          animating: false,
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 8),
          child: Row(
            children: [
              Expanded(
                child: ActionButton(
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
                          body: ProductionFacilityBlueprintDetails(
                            blueprint: blueprint,
                          ),
                        );
                      },
                    );
                  },
                ),
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
