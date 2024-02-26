import 'package:flutter/material.dart';

import '../../data/powerups.dart';
import '../crafting/blueprint.dart';
import '../crafting/facility_blueprint.dart';
import '../crafting/io_facility_blueprint.dart';
import '../crafting/storage_facility_blueprint.dart';
import '../facility/processing_facility.dart';
import '../facility/production_facility.dart';
import '../item/resource.dart';
import '../facility/io_facility.dart';
import '../facility/facility.dart';
import '../facility/storage_facility.dart';
import '../item/item.dart';
import '../powerup/powerup.dart';
import 'preset.dart';

enum SpeedSetting { normal, paused }

class GameState with ChangeNotifier {
  static late GameState active;

  static GameState create() {
    var game = GameState(
      facilities: [],
      blueprints: [],
      powerups: [],
      storage: {},
      money: 5000000,
    );

    active = game;
    return game;
  }

  List<Facility> facilities;
  Map<Item, int> storage;
  List<Blueprint> blueprints;
  List<Powerup> powerups;
  int money;

  SpeedSetting speedSetting;

  GameState({
    required this.facilities,
    required this.money,
    required this.storage,
    required this.blueprints,
    required this.powerups,
    this.speedSetting = SpeedSetting.normal,
  });

  void loadPreset(Preset preset) {
    money = preset.money;
    facilities = preset.facilities;
    blueprints = preset.blueprints;
    powerups = preset.powerups;
    storage = preset.storage;

    notifyListeners();
  }

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

  void removeFacility(Facility facility) {
    facilities.remove(facility);
    notifyListeners();

    if (powerups.contains(Powerups.facilitySelling)) {
      // Should be replaced by a safer transaction system
      var blueprint = blueprints.firstWhere(
          (element) => element.output.runtimeType == facility.runtimeType);

      changeMoney(blueprint.cost ~/ 2);
    }
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

  void buildFacility(FacilityBlueprint blueprint) {
    if (blueprint is IOFacilityBlueprint) {
      var facility = (blueprint.output as IOFacility).create();
      facilities.add(facility);
    } else if (blueprint is StorageFacilityBlueprint) {
      var facility = (blueprint.output as StorageFacility).create();
      facilities.add(facility);
    }

    changeMoney(-blueprint.cost);
  }

  void addPowerup(Powerup powerup) {
    powerups.add(powerup);
    changeMoney(-powerup.price);
  }

  void addBlueprint(Blueprint blueprint) {
    blueprints.add(blueprint);
    changeMoney(-blueprint.price);
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

  bool fulfillsRequirementsFor(Blueprint blueprint, {bool purchase = false}) {
    if (purchase) {
      return money > blueprint.price;
    }
    return money > blueprint.cost;
  }

  int get timeMultiplier {
    return 1;
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
}
