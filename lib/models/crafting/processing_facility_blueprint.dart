import '../facility/processing_facility.dart';
import 'io_facility_blueprint.dart';

abstract class ProcessingFacilityBlueprint extends IOFacilityBlueprint {
  const ProcessingFacilityBlueprint({
    required ProcessingFacility facility,
    required super.requirements,
    required super.price,
    super.description,
  }) : super(facility: facility);
}
