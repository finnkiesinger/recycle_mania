import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../data/blueprints.dart';
import '../../../models/crafting/io_facility_blueprint.dart';
import '../../../models/crafting/processing_facility_blueprint.dart';
import '../../../models/crafting/production_facility_blueprint.dart';
import '../../../models/crafting/storage_facility_blueprint.dart';
import '../../../models/facility/io_facility.dart';
import '../../../models/facility/production_facility.dart';
import '../../../models/facility/storage_facility.dart';
import '../../../models/util/game_state.dart';
import '../../dashboard/facility/facility_list_item.dart';
import '../../dashboard/facility/processing_blueprint/io_facility_blueprint_details.dart';
import '../../dashboard/facility/production_facility/production_facility_blueprint_details.dart';
import '../../dashboard/facility/storage_blueprint/storage_info.dart';
import '../../util/action_button.dart';
import '../../util/charge_button.dart';

class BlueprintMarket extends StatelessWidget {
  const BlueprintMarket({super.key});

  @override
  Widget build(BuildContext context) {
    var blueprints = Blueprints.all.sortedBy<num>((element) => element.price);

    return ListView.separated(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 100,
      ),
      itemCount: Blueprints.all.length,
      itemBuilder: (context, index) {
        var blueprint = blueprints[index];

        if (blueprint is IOFacilityBlueprint) {
          return _IOFacilityBlueprintMarketItem(blueprint: blueprint);
        } else if (blueprint is StorageFacilityBlueprint) {
          return _StorageFacilityBlueprintMarketItem(blueprint: blueprint);
        }
        return Container();
      },
      separatorBuilder: (context, index) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
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
    );
  }
}

class _IOFacilityBlueprintMarketItem extends StatelessWidget {
  final IOFacilityBlueprint blueprint;
  const _IOFacilityBlueprintMarketItem({
    required this.blueprint,
  });

  IOFacility get facility => blueprint.output as IOFacility;

  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();
    var inInventory = game.blueprints.contains(blueprint);

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

                    var child = facility is ProductionFacility
                        ? ProductionFacilityBlueprintDetails(
                            blueprint: blueprint as ProductionFacilityBlueprint,
                          )
                        : IOFacilityBlueprintDetails(
                            blueprint:
                                blueprint as ProcessingFacilityBlueprint);

                    showCupertinoModalBottomSheet(
                      context: context,
                      enableDrag: false,
                      isDismissible: false,
                      barrierColor: Colors.black38,
                      duration: const Duration(milliseconds: 250),
                      builder: (context) {
                        return Scaffold(
                          body: child,
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 150),
                  child: inInventory
                      ? ChargeButton(
                          key: const ValueKey<bool>(false),
                          icon: Icons.attach_money_rounded,
                          text: "BOUGHT",
                          color: const Color.fromARGB(255, 0, 163, 95),
                          chargeColor: const Color.fromARGB(255, 0, 114, 67),
                          disabled: true,
                          onTap: () {},
                          chargeTime: 1.0,
                          hint: "",
                        )
                      : ChargeButton(
                          key: const ValueKey<bool>(true),
                          icon: Icons.attach_money_rounded,
                          text: "BUY",
                          color: const Color.fromARGB(255, 0, 163, 95),
                          chargeColor: const Color.fromARGB(255, 0, 114, 67),
                          disabled: !game.fulfillsRequirementsFor(blueprint,
                              purchase: true),
                          onTap: () {
                            game.addBlueprint(blueprint);
                            HapticFeedback.lightImpact();
                          },
                          chargeTime: 1.0,
                          hint:
                              "Price: \$${NumberFormat.decimalPattern(Localizations.localeOf(context).toString()).format(blueprint.price)}",
                        ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StorageFacilityBlueprintMarketItem extends StatelessWidget {
  final StorageFacilityBlueprint blueprint;
  const _StorageFacilityBlueprintMarketItem({
    required this.blueprint,
  });

  StorageFacility get facility => blueprint.output as StorageFacility;

  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();
    var inInventory = game.blueprints.contains(blueprint);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StorageInfo(blueprint: blueprint),
          const SizedBox(height: 32),
          Row(
            children: [
              const Spacer(),
              const SizedBox(width: 16),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 150),
                  child: inInventory
                      ? ChargeButton(
                          key: const ValueKey<bool>(false),
                          icon: Icons.attach_money_rounded,
                          text: "BOUGHT",
                          color: const Color.fromARGB(255, 0, 163, 95),
                          chargeColor: const Color.fromARGB(255, 0, 114, 67),
                          disabled: true,
                          onTap: () {},
                          chargeTime: 1.0,
                          hint: "",
                        )
                      : ChargeButton(
                          key: const ValueKey<bool>(true),
                          icon: Icons.attach_money_rounded,
                          text: "BUY",
                          color: const Color.fromARGB(255, 0, 163, 95),
                          chargeColor: const Color.fromARGB(255, 0, 114, 67),
                          disabled: !game.fulfillsRequirementsFor(
                            blueprint,
                            purchase: true,
                          ),
                          onTap: () {
                            game.addBlueprint(blueprint);
                            HapticFeedback.lightImpact();
                          },
                          chargeTime: 1.0,
                          hint:
                              "Price: \$${NumberFormat.decimalPattern(Localizations.localeOf(context).toString()).format(blueprint.price)}",
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
