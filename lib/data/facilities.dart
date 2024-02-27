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
              amount: 4,
            ),
            const Output(
              item: Resources.metal,
              amount: 2,
            ),
          ],
          time: 5,
          cooldown: 5,
        );

  @override
  IOFacility<Waste, Resource> create() {
    return OldComputersProcessingFacility();
  }

  @override
  String get storageType => "OLD_COMPUTERS_PROCESSING_FACILITY";
}

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
          time: 5,
          cooldown: 5,
        );

  @override
  IOFacility<Resource, Product> create() {
    return ComputerProductionFacility();
  }

  @override
  String get storageType => "COMPUTER_PRODUCTION_FACILITY";
}

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

class Facilities {
  static final oldComputersProcessingFacility =
      OldComputersProcessingFacility();
  static final computersProductionFacility = ComputerProductionFacility();
  static final metalStorageFacility = MetalStorageFacility();
  static final plasticStorageFacility = PlasticStorageFacility();

  static final all = [
    oldComputersProcessingFacility,
    computersProductionFacility,
    metalStorageFacility,
    plasticStorageFacility,
  ];
}
