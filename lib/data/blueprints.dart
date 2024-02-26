import '../models/crafting/blueprint.dart';
import '../models/crafting/processing_facility_blueprint.dart';
import '../models/crafting/production_facility_blueprint.dart';
import '../models/crafting/storage_facility_blueprint.dart';
import '../models/util/input.dart';
import 'crafting_items.dart';
import 'facilities.dart';
import 'resources.dart';

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
          price: 50000,
          description:
              "The first step in the recycling process of old computers is wiping the data from the device. It is then dismantled and the materials get separated before being shredded into small pieces. The materials can then be recycled. Hazardous waste is removed in the process and disposed of in a safe and environmentally responsible manner.",
        );

  @override
  Blueprint create() {
    return OldComputerProcessingFacilityBlueprint();
  }
}

class ComputerProductionFacilityBlueprint extends ProductionFacilityBlueprint {
  ComputerProductionFacilityBlueprint()
      : super(
          facility: Facilities.computersProductionFacility,
          price: 100000,
          requirements: [],
        );

  @override
  Blueprint create() {
    return ComputerProductionFacilityBlueprint();
  }
}

class MetalStorageFacilityBlueprint extends StorageFacilityBlueprint<Metal> {
  MetalStorageFacilityBlueprint()
      : super(
            facility: Facilities.metalStorageFacility,
            requirements: [
              Input(
                amount: 1,
                item: CraftingItems.costPlaceholder(10000),
              ),
            ],
            price: 25000,
            description: "This facility stores Metal.");

  @override
  Blueprint create() {
    return MetalStorageFacilityBlueprint();
  }
}

class PlasticStorageFacilityBlueprint
    extends StorageFacilityBlueprint<Plastic> {
  PlasticStorageFacilityBlueprint()
      : super(
            facility: Facilities.plasticStorageFacility,
            requirements: [
              Input(
                amount: 1,
                item: CraftingItems.costPlaceholder(10000),
              ),
            ],
            price: 40000,
            description: "This facility stores Plastic.");

  @override
  Blueprint create() {
    return PlasticStorageFacilityBlueprint();
  }
}

class Blueprints {
  static final oldComputerProcessingFacilityBlueprint =
      OldComputerProcessingFacilityBlueprint();

  static final computerProductionFacilityBlueprint =
      ComputerProductionFacilityBlueprint();

  static final metalStorageFacilityBlueprint = MetalStorageFacilityBlueprint();
  static final plasticStorageFacilityBlueprint =
      PlasticStorageFacilityBlueprint();

  static final all = [
    oldComputerProcessingFacilityBlueprint,
    computerProductionFacilityBlueprint,
    metalStorageFacilityBlueprint,
    plasticStorageFacilityBlueprint,
  ];
}
