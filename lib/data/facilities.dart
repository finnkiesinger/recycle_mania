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
}

class Facilities {
  static final oldComputersProcessingFacility =
      OldComputersProcessingFacility();
  static final computersProductionFacility = ComputerProductionFacility();
  static final metalStorageFacility = MetalStorageFacility();
  static final plasticStorageFacility = PlasticStorageFacility();
}
