import '../facility/static_facility.dart';
import 'facility_blueprint.dart';

abstract class StaticFacilityBlueprint extends FacilityBlueprint {
  StaticFacilityBlueprint({
    required StaticFacility facility,
    required super.requirements,
    required super.price,
    super.description,
  }) : super(facility: facility);
}
