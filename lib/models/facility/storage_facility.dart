import '../item/item.dart';

import 'static_facility.dart';

abstract class StorageFacility<T extends Item> extends StaticFacility {
  final T item;

  const StorageFacility({
    required super.name,
    required super.cost,
    required this.item,
  });

  int get capacity => 5;
}
