import 'package:recycle_mania/models/facility/facility.dart';

abstract class StaticFacility extends Facility {
  StaticFacility({
    required super.name,
    required super.cost,
  });
}
