import 'package:recycle_mania/models/util/game_state.dart';

import 'io_facility.dart';
import '../util/output.dart';
import '../item/resource.dart';
import '../util/input.dart';
import '../item/waste.dart';

class ProcessingFacility extends IOFacility<Waste, Resource> {
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
  void end() {}

  @override
  bool get canStart => inputCost < GameState.active.money;
}
