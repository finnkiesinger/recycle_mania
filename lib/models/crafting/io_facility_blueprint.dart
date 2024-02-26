import '../facility/io_facility.dart';
import 'facility_blueprint.dart';

abstract class IOFacilityBlueprint extends FacilityBlueprint {
  const IOFacilityBlueprint({
    required IOFacility facility,
    required super.requirements,
    required super.price,
    super.description,
  }) : super(facility: facility);
}
