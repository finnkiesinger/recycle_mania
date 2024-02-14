import '../facility/production_facility.dart';
import 'io_facility_blueprint.dart';

abstract class ProductionFacilityBlueprint extends IOFacilityBlueprint {
  const ProductionFacilityBlueprint({
    required ProductionFacility facility,
    required super.requirements,
  }) : super(facility: facility);
}
