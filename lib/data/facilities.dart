import '../models/facility/production_facility.dart';
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
          time: 1,
          cooldown: 1,
        );
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
          time: 1,
          cooldown: 1,
        );
}

class Facilities {
  static final oldComputersProcessingFacility =
      OldComputersProcessingFacility();

  static final computersProductionFacility = ComputerProductionFacility();
}
