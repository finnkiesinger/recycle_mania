import '../facility/facility.dart';
import 'blueprint.dart';

abstract class FacilityBlueprint extends Blueprint {
  const FacilityBlueprint({
    required Facility facility,
    required super.requirements,
    required super.price,
    super.description,
  }) : super(
          output: facility,
        );
}
