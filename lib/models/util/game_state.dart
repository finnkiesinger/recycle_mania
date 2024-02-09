import 'package:flutter/material.dart';

import '../facility/processing_facility.dart';
import '../facility/production_facility.dart';
import '../item/resource.dart';
import '../../data/facilities.dart';
import '../../data/resources.dart';
import '../facility/io_facility.dart';
import '../facility/facility.dart';
import '../facility/storage_facility.dart';
import '../item/item.dart';

enum SpeedSetting { normal, paused }

class GameState with ChangeNotifier {
  static late GameState active;

  static GameState create() {
    var game = GameState(
      facilities: [
        StorageFacility(
          name: "Metal Storage",
          capacity: 100,
          cost: 1,
          item: Resources.metal,
        ),
        StorageFacility(
          name: "Plastic Storage",
          capacity: 100,
          cost: 1,
          item: Resources.plastic,
        ),
        Facilities.oldComputersProcessingFacility,
        Facilities.computersProductionFacility,
      ],
      storage: {},
      money: 50000,
    );

    active = game;
    return game;
  }

  final List<Facility> facilities;
  final Map<Item, int> storage;
  int money;

  SpeedSetting speedSetting;

  GameState({
    required this.facilities,
    required this.money,
    required this.storage,
    this.speedSetting = SpeedSetting.normal,
  });

  void update() {
    var runningCost = 0;

    for (var facility in facilities) {
      runningCost += facility.cost;

      if (facility is IOFacility) {
        facility.step();
      }
    }

    _changeMoney(-runningCost);
  }

  void _changeMoney(int amount) {
    money += amount;
    notifyListeners();
  }

  bool changeMoney(int amount) {
    if (money + amount > 0) {
      _changeMoney(amount);
      return true;
    }
    return false;
  }

  double productionRate(Resource resource) {
    var rate = 0.0;
    for (var facility in facilities.whereType<ProcessingFacility>()) {
      for (var output in facility.output) {
        if (output.item == resource) {
          rate += output.amount / (facility.time + facility.cooldown);
        }
      }
    }
    return rate;
  }

  double consumptionRate(Resource resource) {
    var rate = 0.0;
    for (var facility in facilities.whereType<ProductionFacility>()) {
      for (var input in facility.input) {
        if (input.item == resource) {
          rate += input.amount / (facility.time + facility.cooldown);
        }
      }
    }
    return rate;
  }

  void togglePause(IOFacility facility) {
    facility.togglePause();
    notifyListeners();
  }

  void changeSpeed(SpeedSetting setting) {
    speedSetting = setting;
    notifyListeners();
  }

  void changeStorage(Item item, int amount) {
    storage[item] = (storage[item] ?? 0) + amount;
    notifyListeners();
  }

  double get activeCost {
    var cost = 0.0;
    var profit = 0.0;
    for (var facility in facilities) {
      cost += facility.cost;

      if (facility is ProcessingFacility && !facility.paused) {
        for (var input in facility.input) {
          cost += input.item.price *
              input.amount /
              (facility.time + facility.cooldown);
        }
      }

      if (facility is ProductionFacility && !facility.paused) {
        for (var output in facility.output) {
          profit += output.item.price *
              output.amount /
              (facility.time + facility.cooldown);
        }
      }
    }
    return profit - cost;
  }

  int totalCapacity(Resource resource) {
    var capacity = 0;

    for (var facility in facilities) {
      if (facility is StorageFacility) {
        if (facility.item == resource) {
          capacity += facility.capacity;
        }
      }
    }

    return capacity;
  }
}
