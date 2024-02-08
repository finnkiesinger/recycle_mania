import '../models/util/input.dart';
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
              item: plastic,
              amount: 10,
            ),
            const Output(
              item: metal,
              amount: 1,
            ),
          ],
          time: 2,
          cooldown: 2,
        );
}

final oldComputersProcessingFacility = OldComputersProcessingFacility();
