import '../facility/production_facility.dart';
import 'io_facility_blueprint.dart';

abstract class ProductionFacilityBlueprint extends IOFacilityBlueprint {
  const ProductionFacilityBlueprint({
    required ProductionFacility facility,
    required super.price,
    required super.requirements,
  }) : super(facility: facility);
}
