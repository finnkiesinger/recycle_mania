import 'io_facility.dart';

import '../util/game_state.dart';
import '../util/input.dart';
import '../util/output.dart';
import '../item/product.dart';
import '../item/resource.dart';

abstract class ProductionFacility extends IOFacility<Resource, Product> {
  @override
  final int time;

  @override
  final int cooldown;

  @override
  final List<Input<Resource>> input;

  @override
  final List<Output<Product>> output;

  ProductionFacility({
    required super.name,
    required super.cost,
    required this.time,
    required this.input,
    required this.output,
    required this.cooldown,
  });

  @override
  void start() {
    for (var i in input) {
      GameState.active.changeStorage(i.item, -i.amount);
    }
  }

  @override
  void end() {
    GameState.active.changeMoney(profit);
  }

  int get profit {
    int profit = 0;

    for (var o in output) {
      profit += o.amount * o.item.price;
    }

    return profit;
  }

  @override
  bool get canStart {
    for (var i in input) {
      if ((GameState.active.storage[i.item] ?? 0) < i.amount) {
        return false;
      }
    }

    return true;
  }
}
