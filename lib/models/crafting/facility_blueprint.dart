import '../facility/facility.dart';
import 'blueprint.dart';

class FacilityBlueprint extends Blueprint {
  const FacilityBlueprint({
    required Facility facility,
    required super.requirement,
  }) : super(
          output: facility,
        );
}
