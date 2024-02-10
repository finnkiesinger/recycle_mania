import '../crafting/craftable.dart';

abstract class Facility with Craftable {
  final String name;
  final int cost;

  Facility({
    required this.name,
    required this.cost,
  });
}
