import '../models/crafting/processing_facility_blueprint.dart';
import '../models/crafting/production_facility_blueprint.dart';
import 'facilities.dart';

class OldComputerProcessingFacilityBlueprint
    extends ProcessingFacilityBlueprint {
  OldComputerProcessingFacilityBlueprint()
      : super(
          facility: Facilities.oldComputersProcessingFacility,
          requirements: [],
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
