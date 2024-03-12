import '../models/facility/facility.dart';
import '../models/facility/io_facility.dart';
import '../models/facility/production_facility.dart';
import '../models/facility/storage_facility.dart';
import '../models/item/product.dart';
import '../models/item/resource.dart';
import '../models/item/waste.dart';
import '../models/util/input.dart';
import 'products.dart';
import 'resources.dart';
import 'wastes.dart';
import '../models/facility/processing_facility.dart';
import '../models/util/output.dart';

///
/// PROCESSING FACILITIES
///

class OldComputersProcessingFacility extends ProcessingFacility {
  OldComputersProcessingFacility()
      : super(
          name: "Old Computers",
          cost: 1,
          input: [
            const Input(
              item: oldComputer,
              amount: 1,
            ),
          ],
          output: [
            const Output(
              item: Resources.plastic,
              amount: 1,
            ),
            const Output(
              item: Resources.metal,
              amount: 1,
            ),
          ],
          time: 10,
          cooldown: 5,
        );

  @override
  IOFacility<Waste, Resource> create() {
    return OldComputersProcessingFacility();
  }

  @override
  String get storageType => "OLD_COMPUTERS_PROCESSING_FACILITY";
}

class FoodWasteProcessingFacility extends ProcessingFacility {
  FoodWasteProcessingFacility()
      : super(
          name: "Food Waste",
          cost: 1,
          input: [
            const Input(
              item: foodScraps,
              amount: 5,
            ),
          ],
          output: [
            const Output(
              item: Resources.organic,
              amount: 1,
            ),
          ],
          time: 1,
          cooldown: 1,
        );

  @override
  IOFacility<Waste, Resource> create() {
    return FoodWasteProcessingFacility();
  }

  @override
  String get storageType => "FOOD_WASTE_PROCESSING_FACILITY";
}

class YardWasteProcessingFacility extends ProcessingFacility {
  YardWasteProcessingFacility()
      : super(
          name: "Yard Waste",
          cost: 1,
          input: [
            const Input(
              item: foodScraps,
              amount: 5,
            ),
          ],
          output: [
            const Output(
              item: Resources.organic,
              amount: 1,
            ),
          ],
          time: 1,
          cooldown: 1,
        );

  @override
  IOFacility<Waste, Resource> create() {
    return YardWasteProcessingFacility();
  }

  @override
  String get storageType => "YARD_WASTE_PROCESSING_FACILITY";
}

class PaperProcessingFacility extends ProcessingFacility {
  PaperProcessingFacility()
      : super(
          name: "Mixed Paper",
          cost: 1,
          input: [
            const Input(
              item: mixedPaper,
              amount: 2,
            ),
          ],
          output: [
            const Output(
              item: Resources.paper,
              amount: 1,
            ),
          ],
          time: 10,
          cooldown: 1,
        );

  @override
  IOFacility<Waste, Resource> create() {
    return PaperProcessingFacility();
  }

  @override
  String get storageType => "PAPER_PROCESSING_FACILITY";
}

class MetalScrapsProcessingFacility extends ProcessingFacility {
  MetalScrapsProcessingFacility()
      : super(
          name: "Metal Scraps",
          cost: 1,
          input: [
            const Input(
              item: metalScraps,
              amount: 5,
            ),
          ],
          output: [
            const Output(
              item: Resources.metal,
              amount: 1,
            ),
          ],
          time: 5,
          cooldown: 1,
        );

  @override
  IOFacility<Waste, Resource> create() {
    return MetalScrapsProcessingFacility();
  }

  @override
  String get storageType => "METAL_SCRAPS_PROCESSING_FACILITY";
}

class OldPlasticBottlesProcessingFacility extends ProcessingFacility {
  OldPlasticBottlesProcessingFacility()
      : super(
          name: "PET Bottles",
          cost: 1,
          input: [
            const Input(
              item: oldPlasticBottles,
              amount: 1,
            ),
          ],
          output: [
            const Output(
              item: Resources.plastic,
              amount: 1,
            ),
          ],
          time: 10,
          cooldown: 3,
        );

  @override
  IOFacility<Waste, Resource> create() {
    return OldPlasticBottlesProcessingFacility();
  }

  @override
  String get storageType => "OLD_PLASTIC_BOTTLES_PROCESSING_FACILITY";
}

class OldGlassBottlesProcessingFacility extends ProcessingFacility {
  OldGlassBottlesProcessingFacility()
      : super(
          name: "Glass Bottles",
          cost: 1,
          input: [
            const Input(
              item: oldGlassBottles,
              amount: 1,
            ),
          ],
          output: [
            const Output(
              item: Resources.glass,
              amount: 1,
            ),
          ],
          time: 5,
          cooldown: 3,
        );

  @override
  IOFacility<Waste, Resource> create() {
    return OldPlasticBottlesProcessingFacility();
  }

  @override
  String get storageType => "OLD_PLASTIC_BOTTLES_PROCESSING_FACILITY";
}

///
/// PRODUCTION FACILITIES
///

class ComputerProductionFacility extends ProductionFacility {
  ComputerProductionFacility()
      : super(
          name: "Computers",
          cost: 1,
          input: [
            const Input(
              item: Resources.metal,
              amount: 1,
            ),
            const Input(
              item: Resources.plastic,
              amount: 2,
            ),
          ],
          output: [
            const Output(
              item: Computer(),
              amount: 1,
            ),
          ],
          time: 15,
          cooldown: 3,
        );

  @override
  IOFacility<Resource, Product> create() {
    return ComputerProductionFacility();
  }

  @override
  String get storageType => "COMPUTER_PRODUCTION_FACILITY";
}

class CompostBagProductionFacility extends ProductionFacility {
  CompostBagProductionFacility()
      : super(
          name: "Compost Bag",
          cost: 1,
          input: [
            const Input(
              item: Resources.organic,
              amount: 5,
            ),
            const Input(
              item: Resources.paper,
              amount: 1,
            ),
          ],
          output: [
            const Output(
              item: CompostBag(),
              amount: 1,
            ),
          ],
          time: 5,
          cooldown: 2,
        );

  @override
  IOFacility<Resource, Product> create() {
    return CompostBagProductionFacility();
  }

  @override
  String get storageType => "COMPOST_BAG_PRODUCTION_FACILITY";
}

class PaperStackProductionFacility extends ProductionFacility {
  PaperStackProductionFacility()
      : super(
          name: "Paper Stack",
          cost: 1,
          input: [
            const Input(
              item: Resources.paper,
              amount: 10,
            ),
          ],
          output: [
            const Output(
              item: PaperStack(),
              amount: 1,
            ),
          ],
          time: 3,
          cooldown: 5,
        );

  @override
  IOFacility<Resource, Product> create() {
    return PaperStackProductionFacility();
  }

  @override
  String get storageType => "PAPER_STACK_PRODUCTION_FACILITY";
}

class GlassBottleProductionFacility extends ProductionFacility {
  GlassBottleProductionFacility()
      : super(
          name: "Glass Bottle",
          cost: 1,
          input: [
            const Input(
              item: Resources.glass,
              amount: 2,
            ),
          ],
          output: [
            const Output(
              item: GlassBottle(),
              amount: 1,
            ),
          ],
          time: 5,
          cooldown: 5,
        );

  @override
  IOFacility<Resource, Product> create() {
    return GlassBottleProductionFacility();
  }

  @override
  String get storageType => "GLASS_BOTTLE_PRODUCTION_FACILITY";
}

class NailProductionFacility extends ProductionFacility {
  NailProductionFacility()
      : super(
          name: "Nails",
          cost: 1,
          input: [
            const Input(
              item: Resources.metal,
              amount: 1,
            ),
          ],
          output: [
            const Output(
              item: Nails(),
              amount: 10,
            ),
          ],
          time: 10,
          cooldown: 10,
        );

  @override
  IOFacility<Resource, Product> create() {
    return GlassBottleProductionFacility();
  }

  @override
  String get storageType => "NAILS_PRODUCTION_FACILITY";
}

///
/// STORAGE FACILITIES
///

class MetalStorageFacility extends StorageFacility<Metal> {
  MetalStorageFacility()
      : super(
          cost: 1,
          name: "Metal Storage",
          item: Resources.metal,
        );

  @override
  Facility create() {
    return MetalStorageFacility();
  }

  @override
  String get storageType => "METAL_STORAGE_FACILITY";
}

class PlasticStorageFacility extends StorageFacility<Plastic> {
  PlasticStorageFacility()
      : super(
          cost: 1,
          name: "Plastic Storage",
          item: Resources.plastic,
        );

  @override
  Facility create() {
    return PlasticStorageFacility();
  }

  @override
  String get storageType => "PLASTIC_STORAGE_FACILITY";
}

class OrganicStorageFacility extends StorageFacility<Organic> {
  OrganicStorageFacility()
      : super(
          cost: 1,
          name: "Organic Storage",
          item: Resources.organic,
        );

  @override
  Facility create() {
    return OrganicStorageFacility();
  }

  @override
  String get storageType => "ORGANIC_STORAGE_FACILITY";
}

class PaperStorageFacility extends StorageFacility<Paper> {
  PaperStorageFacility()
      : super(
          cost: 1,
          name: "Paper Storage",
          item: Resources.paper,
        );

  @override
  Facility create() {
    return PaperStorageFacility();
  }

  @override
  String get storageType => "PAPER_STORAGE_FACILITY";
}

class GlassStorageFacility extends StorageFacility<Glass> {
  GlassStorageFacility()
      : super(
          cost: 1,
          name: "Glass Storage",
          item: Resources.glass,
        );

  @override
  Facility create() {
    return GlassStorageFacility();
  }

  @override
  String get storageType => "GLASS_STORAGE_FACILITY";
}

class Facilities {
  static final oldComputersProcessingFacility =
      OldComputersProcessingFacility();
  static final foodWasteProcessingFacility = FoodWasteProcessingFacility();
  static final yardWasteProcessingFacility = YardWasteProcessingFacility();
  static final mixedPaperProcessingFacility = PaperProcessingFacility();
  static final metalScrapsProcessingFacility = MetalScrapsProcessingFacility();
  static final oldPlasticBottlesProcessingFacility =
      OldPlasticBottlesProcessingFacility();
  static final oldGlassBottlesProcessingFacility =
      OldGlassBottlesProcessingFacility();

  static final metalStorageFacility = MetalStorageFacility();
  static final plasticStorageFacility = PlasticStorageFacility();
  static final glassStorageFacility = GlassStorageFacility();
  static final paperStorageFacility = PaperStorageFacility();
  static final organicStorageFacility = OrganicStorageFacility();

  static final computersProductionFacility = ComputerProductionFacility();
  static final nailsProductionFacility = NailProductionFacility();
  static final glassBottleProductionFacility = GlassBottleProductionFacility();
  static final paperStackProductionFacility = PaperStackProductionFacility();
  static final compostBagProductionFacility = CompostBagProductionFacility();

  static final all = [
    // Processing
    oldComputersProcessingFacility,
    foodWasteProcessingFacility,
    yardWasteProcessingFacility,
    mixedPaperProcessingFacility,
    metalScrapsProcessingFacility,
    oldPlasticBottlesProcessingFacility,
    oldGlassBottlesProcessingFacility,
    // Storage
    metalStorageFacility,
    plasticStorageFacility,
    glassStorageFacility,
    paperStorageFacility,
    organicStorageFacility,
    // Production
    computersProductionFacility,
    nailsProductionFacility,
    glassBottleProductionFacility,
    paperStackProductionFacility,
    compostBagProductionFacility,
  ];
}
