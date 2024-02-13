import 'facility.dart';

abstract class StaticFacility extends Facility {
  const StaticFacility({
    required super.name,
    required super.cost,
  });
}
