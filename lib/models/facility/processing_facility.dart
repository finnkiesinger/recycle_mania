import '../../data/powerups.dart';
import '../util/game_state.dart';
import 'io_facility.dart';
import '../util/output.dart';
import '../item/resource.dart';
import '../util/input.dart';
import '../item/waste.dart';

abstract class ProcessingFacility extends IOFacility<Waste, Resource> {
  @override
  final int time;

  @override
  final int cooldown;

  @override
  final List<Input<Waste>> input;

  @override
  final List<Output<Resource>> output;

  ProcessingFacility({
    required super.name,
    required super.cost,
    required this.input,
    required this.output,
    required this.time,
    required this.cooldown,
  });

  @override
  void start() {
    GameState.active.changeMoney(-inputCost);
  }

  int get inputCost {
    var acc = 0;

    for (var i in input) {
      acc += i.amount * i.item.price;
    }
    return acc;
  }

  @override
  void end() {
    for (var o in output) {
      int storedAmount = GameState.active.storage[o.item] ?? 0;
      int capacity = GameState.active.totalCapacity(o.item);
      int available = capacity - storedAmount;

      if (o.amount < available) {
        GameState.active.changeStorage(o.item, o.amount);
        continue;
      }

      GameState.active.changeStorage(o.item, available);

      int sellAmount = o.amount - available;
      if (GameState.active.powerups.where((element) {
        if (element is AutoSellPowerup) {
          if (element.item == o.item) {
            return true;
          }
        }
        return false;
      }).isNotEmpty) {
        GameState.active.changeMoney(sellAmount * o.item.price);
      }
    }
  }

  @override
  bool get canStart => inputCost < GameState.active.money;
}
