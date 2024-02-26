import '../crafting/craftable.dart';
import '../util/storable.dart';

abstract class Facility with Craftable, Storable {
  final String name;
  final int cost;

  const Facility({
    required this.name,
    required this.cost,
  });

  Facility create();
}
