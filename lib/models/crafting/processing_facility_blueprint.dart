import '../facility/processing_facility.dart';
import 'io_facility_blueprint.dart';

class ProcessingFacilityBlueprint extends IOFacilityBlueprint {
  const ProcessingFacilityBlueprint({
    required ProcessingFacility facility,
    required super.requirements,
    super.description,
  }) : super(facility: facility);
}
