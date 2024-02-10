import 'package:recycle_mania/models/crafting/facility_blueprint.dart';

import '../facility/production_facility.dart';

class ProductionFacilityBlueprint extends FacilityBlueprint {
  const ProductionFacilityBlueprint({
    required ProductionFacility facility,
    required super.requirements,
  }) : super(facility: facility);
}
