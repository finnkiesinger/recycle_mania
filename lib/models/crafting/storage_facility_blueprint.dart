import '../facility/storage_facility.dart';
import '../item/item.dart';
import 'static_facility_blueprint.dart';

abstract class StorageFacilityBlueprint<T extends Item>
    extends StaticFacilityBlueprint {
  StorageFacilityBlueprint({
    required StorageFacility<T> facility,
    required super.requirements,
    super.description,
  }) : super(facility: facility);
}
