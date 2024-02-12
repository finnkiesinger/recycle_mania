import '../facility/io_facility.dart';
import 'facility_blueprint.dart';

class IOFacilityBlueprint extends FacilityBlueprint {
  const IOFacilityBlueprint({
    required IOFacility facility,
    required super.requirements,
  }) : super(facility: facility);
}
