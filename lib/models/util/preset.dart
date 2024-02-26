import '../crafting/blueprint.dart';
import '../facility/facility.dart';
import '../item/item.dart';
import '../powerup/powerup.dart';

class Preset {
  final String name;
  final List<Blueprint> blueprints;
  final List<Facility> facilities;
  final int money;
  final List<Powerup> powerups;
  final Map<Item, int> storage;

  Preset({
    required this.name,
    required this.blueprints,
    required this.facilities,
    required this.money,
    required this.powerups,
    required this.storage,
  });
}
