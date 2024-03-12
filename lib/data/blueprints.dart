import '../models/crafting/blueprint.dart';
import '../models/crafting/processing_facility_blueprint.dart';
import '../models/crafting/production_facility_blueprint.dart';
import '../models/crafting/storage_facility_blueprint.dart';
import '../models/util/input.dart';
import 'crafting_items.dart';
import 'facilities.dart';
import 'resources.dart';

///
/// PROCESSING BLUEPRINTS
///

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

class FoodWasteProcessingFacilityBlueprint extends ProcessingFacilityBlueprint {
  FoodWasteProcessingFacilityBlueprint()
      : super(
          facility: Facilities.foodWasteProcessingFacility,
          requirements: [
            const Input(
              item: CraftingItems.preProcessor,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.compositingStation,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.curationStation,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.screeningStation,
              amount: 1,
            ),
          ],
          price: 10000,
          description:
              "The first step is pre-processing the food waste. Contaminants like plastic are removed and afterwards, the waste is shredded. Afterwards, compositing begins. Microorganisms break down organic matter over time through aerobic decomposition, which requires oxygen. A balance between carbon-rich and nitrogen-rich materials is key in the process. During curing, the compost matures further. The last step is screening, where the compost is checked again for debris.",
        );

  @override
  Blueprint create() {
    return FoodWasteProcessingFacilityBlueprint();
  }
}

class YardWasteProcessingFacilityBlueprint extends ProcessingFacilityBlueprint {
  YardWasteProcessingFacilityBlueprint()
      : super(
          facility: Facilities.yardWasteProcessingFacility,
          requirements: [
            const Input(
              item: CraftingItems.preProcessor,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.compositingStation,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.curationStation,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.screeningStation,
              amount: 1,
            ),
          ],
          price: 10000,
          description:
              "The first step is pre-processing the yard waste. Contaminants like plastic are removed and afterwards, the waste is shredded. Afterwards, compositing begins. Microorganisms break down organic matter over time through aerobic decomposition, which requires oxygen. A balance between carbon-rich and nitrogen-rich materials is key in the process. During curing, the compost matures further. The last step is screening, where the compost is checked again for debris.",
        );

  @override
  Blueprint create() {
    return FoodWasteProcessingFacilityBlueprint();
  }
}

class MixedPaperProcessingFacilityBlueprint
    extends ProcessingFacilityBlueprint {
  MixedPaperProcessingFacilityBlueprint()
      : super(
          facility: Facilities.mixedPaperProcessingFacility,
          requirements: [
            const Input(
              item: CraftingItems.sortingStation,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.pulpingStation,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.deInkingStation,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.screeningStation,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.bleachingStation,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.papermakingStation,
              amount: 1,
            ),
          ],
          price: 15000,
          description:
              "Newspapers, magazines, cardboard and other paper products are first separated, then each get shredded and broken down into pulp. Ink is disposed of, as well as other contaminants. The pulp may then be bleached before it is then turned into paper again.",
        );

  @override
  Blueprint create() {
    return MixedPaperProcessingFacilityBlueprint();
  }
}

class OldPlasticBottlesProcessingFacilityBlueprint
    extends ProcessingFacilityBlueprint {
  OldPlasticBottlesProcessingFacilityBlueprint()
      : super(
          facility: Facilities.oldPlasticBottlesProcessingFacility,
          requirements: [
            const Input(
              item: CraftingItems.plasticSortingStation,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.balingStation,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.shredder,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.washingStation,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.plasticMeltingStation,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.pelletizingStation,
              amount: 1,
            ),
          ],
          price: 65000,
          description:
              "PET Bottles are first sorted by color. Then they are compressed into bales for transport and then shredded. The next steps are washing, decontamination, melting and finally pelletization.",
        );

  @override
  Blueprint create() {
    return OldPlasticBottlesProcessingFacilityBlueprint();
  }
}

class MetalScrapProcessingFacilityBlueprint
    extends ProcessingFacilityBlueprint {
  MetalScrapProcessingFacilityBlueprint()
      : super(
          facility: Facilities.metalScrapsProcessingFacility,
          requirements: [
            const Input(
              item: CraftingItems.metalSortingStation,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.shredder,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.metalMeltingStation,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.purificationStation,
              amount: 1,
            ),
            const Input(
              item: CraftingItems.solidificationStation,
              amount: 1,
            ),
          ],
          price: 25000,
          description:
              "Metal scrap is sorted, shredded, melted, purified, and then solidified into new raw metal ingots.",
        );

  @override
  Blueprint create() {
    return MetalScrapProcessingFacilityBlueprint();
  }
}

///
/// PRODUCTION BLUEPRINTS
///

class ComputerProductionFacilityBlueprint extends ProductionFacilityBlueprint {
  ComputerProductionFacilityBlueprint()
      : super(
          facility: Facilities.computersProductionFacility,
          price: 100000,
          requirements: [
            Input(
              amount: 1,
              item: CraftingItems.costPlaceholder(75000),
            ),
          ],
        );

  @override
  Blueprint create() {
    return ComputerProductionFacilityBlueprint();
  }
}

class NailsProductionFacilityBlueprint extends ProductionFacilityBlueprint {
  NailsProductionFacilityBlueprint()
      : super(
          facility: Facilities.nailsProductionFacility,
          price: 50000,
          requirements: [
            Input(
              amount: 1,
              item: CraftingItems.costPlaceholder(25000),
            ),
          ],
        );

  @override
  Blueprint create() {
    return NailsProductionFacilityBlueprint();
  }
}

class GlassBottleProductionFacilityBlueprint
    extends ProductionFacilityBlueprint {
  GlassBottleProductionFacilityBlueprint()
      : super(
          facility: Facilities.glassBottleProductionFacility,
          price: 50000,
          requirements: [
            Input(
              amount: 1,
              item: CraftingItems.costPlaceholder(15000),
            ),
          ],
        );

  @override
  Blueprint create() {
    return GlassBottleProductionFacilityBlueprint();
  }
}

class PaperStackProductionFacilityBlueprint
    extends ProductionFacilityBlueprint {
  PaperStackProductionFacilityBlueprint()
      : super(
          facility: Facilities.paperStackProductionFacility,
          price: 15000,
          requirements: [
            Input(
              amount: 1,
              item: CraftingItems.costPlaceholder(5000),
            ),
          ],
        );

  @override
  Blueprint create() {
    return PaperStackProductionFacilityBlueprint();
  }
}

class CompostBagProductionFacilityBlueprint
    extends ProductionFacilityBlueprint {
  CompostBagProductionFacilityBlueprint()
      : super(
          facility: Facilities.compostBagProductionFacility,
          price: 5000,
          requirements: [
            Input(
              amount: 1,
              item: CraftingItems.costPlaceholder(2500),
            ),
          ],
        );

  @override
  Blueprint create() {
    return CompostBagProductionFacilityBlueprint();
  }
}

///
/// STORAGE BLUEPRINTS
///

class OrganicStorageFacilityBlueprint
    extends StorageFacilityBlueprint<Organic> {
  OrganicStorageFacilityBlueprint()
      : super(
            facility: Facilities.organicStorageFacility,
            requirements: [
              Input(
                amount: 1,
                item: CraftingItems.costPlaceholder(10000),
              ),
            ],
            price: 15000,
            description: "This facility stores Organics.");

  @override
  Blueprint create() {
    return OrganicStorageFacilityBlueprint();
  }
}

class GlassStorageFacilityBlueprint extends StorageFacilityBlueprint<Glass> {
  GlassStorageFacilityBlueprint()
      : super(
            facility: Facilities.glassStorageFacility,
            requirements: [
              Input(
                amount: 1,
                item: CraftingItems.costPlaceholder(10000),
              ),
            ],
            price: 15000,
            description: "This facility stores Glass.");

  @override
  Blueprint create() {
    return GlassStorageFacilityBlueprint();
  }
}

class PaperStorageFacilityBlueprint extends StorageFacilityBlueprint<Paper> {
  PaperStorageFacilityBlueprint()
      : super(
            facility: Facilities.paperStorageFacility,
            requirements: [
              Input(
                amount: 1,
                item: CraftingItems.costPlaceholder(10000),
              ),
            ],
            price: 5000,
            description: "This facility stores Paper.");

  @override
  Blueprint create() {
    return PaperStorageFacilityBlueprint();
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
  static final foodWasteProcessingFacilityBlueprint =
      FoodWasteProcessingFacilityBlueprint();
  static final yardWasteProcessingFacilityBlueprint =
      YardWasteProcessingFacilityBlueprint();
  static final mixedPaperProcessingFacilityBlueprint =
      MixedPaperProcessingFacilityBlueprint();
  static final oldPlasticBottlesProcessingFacilityBlueprint =
      OldPlasticBottlesProcessingFacilityBlueprint();
  static final metalScrapProcessingFacilityBlueprint =
      MetalScrapProcessingFacilityBlueprint();

  static final computerProductionFacilityBlueprint =
      ComputerProductionFacilityBlueprint();
  static final nailsProductionFacilityBlueprint =
      NailsProductionFacilityBlueprint();
  static final paperStackProductionFacilityBlueprint =
      PaperStackProductionFacilityBlueprint();
  static final glassBottleProductionFacilityBlueprint =
      GlassBottleProductionFacilityBlueprint();
  static final compostBagProductionFacilityBlueprint =
      CompostBagProductionFacilityBlueprint();

  static final metalStorageFacilityBlueprint = MetalStorageFacilityBlueprint();
  static final plasticStorageFacilityBlueprint =
      PlasticStorageFacilityBlueprint();
  static final paperStorageFacilityBlueprint = PaperStorageFacilityBlueprint();
  static final organicStorageFacilityBlueprint =
      OrganicStorageFacilityBlueprint();
  static final glassStorageFacilityBlueprint = GlassStorageFacilityBlueprint();

  static final all = [
    // Processing Blueprints
    oldComputerProcessingFacilityBlueprint,
    foodWasteProcessingFacilityBlueprint,
    yardWasteProcessingFacilityBlueprint,
    mixedPaperProcessingFacilityBlueprint,
    oldPlasticBottlesProcessingFacilityBlueprint,
    metalScrapProcessingFacilityBlueprint,
    // Production Blueprints
    computerProductionFacilityBlueprint,
    nailsProductionFacilityBlueprint,
    paperStackProductionFacilityBlueprint,
    glassBottleProductionFacilityBlueprint,
    compostBagProductionFacilityBlueprint,
    // Storage Blueprints
    metalStorageFacilityBlueprint,
    plasticStorageFacilityBlueprint,
    paperStorageFacilityBlueprint,
    organicStorageFacilityBlueprint,
    glassStorageFacilityBlueprint,
  ];
}
