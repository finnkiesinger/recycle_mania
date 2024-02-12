import '../item/item.dart';

import 'static_facility.dart';

class StorageFacility<T extends Item> extends StaticFacility {
  int capacity;
  T item;

  StorageFacility({
    required super.name,
    required super.cost,
    required this.capacity,
    required this.item,
  });
}
