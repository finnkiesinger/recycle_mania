import '../crafting/craftable.dart';

abstract class Facility with Craftable {
  final String name;
  final int cost;

  const Facility({
    required this.name,
    required this.cost,
  });

  Facility create();
}
