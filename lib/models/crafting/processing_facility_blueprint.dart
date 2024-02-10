import 'facility_blueprint.dart';
import '../facility/processing_facility.dart';

class ProcessingFacilityBlueprint extends FacilityBlueprint {
  const ProcessingFacilityBlueprint({
    required ProcessingFacility facility,
    required super.requirements,
  }) : super(facility: facility);
}
