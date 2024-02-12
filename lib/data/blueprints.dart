import '../models/crafting/processing_facility_blueprint.dart';
import '../models/crafting/production_facility_blueprint.dart';
import '../models/util/input.dart';
import 'crafting.dart';
import 'facilities.dart';

class OldComputerProcessingFacilityBlueprint
    extends ProcessingFacilityBlueprint {
  OldComputerProcessingFacilityBlueprint()
      : super(
          facility: Facilities.oldComputersProcessingFacility,
          requirements: [
            const Input(
              item: CraftingItems.dataWiper,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.computerDismantlingStation,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.shredder,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.meltingStation,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.hazardousWasteDisposer,
              amount: 1,
            ),
          ],
          description:
              "The first step in the recycling process of old computers is wiping the data from the device. It is then dismantled and the materials get separated before being shredded into small pieces. The materials can then be recycled. Hazardous waste is removed in the process and disposed of in a safe and environmentally responsible manner.",
        );
}

class ComputerProductionFacilityBlueprint extends ProductionFacilityBlueprint {
  ComputerProductionFacilityBlueprint()
      : super(
          facility: Facilities.computersProductionFacility,
          requirements: [],
        );
}

class Blueprints {
  static final oldComputerProcessingFacilityBlueprint =
      OldComputerProcessingFacilityBlueprint();

  static final computerProductionFacilityBlueprint =
      ComputerProductionFacilityBlueprint();

  static final all = [
    oldComputerProcessingFacilityBlueprint,
    computerProductionFacilityBlueprint,
  ];
}
