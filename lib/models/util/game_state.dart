import 'package:flutter/material.dart';

import '../facility/io_facility.dart';
import '../facility/facility.dart';
import '../item/item.dart';

class GameState with ChangeNotifier {
  final List<Facility> facilities;
  final Map<Item, int> storage;
  int money;

  GameState({
    required this.facilities,
    required this.money,
    required this.storage,
  });

  void update() {
    for (var facility in facilities) {
      if (facility is IOFacility) {
        facility.step();
      }
    }

    notifyListeners();
  }
}
