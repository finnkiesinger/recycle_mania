import 'package:flutter/material.dart';

import '../models/item/item.dart';
import '../models/util/rm_icon.dart';

class Shredder extends Item {
  const Shredder()
      : super(
            icon: const RMIcon(icon: Icons.abc_rounded),
            name: "Shredder",
            price: 2500,
            description:
                "Shreds materials in small pieces in preparation for the recycling process.");
}

class ComputerDismantlingStation extends Item {
  const ComputerDismantlingStation()
      : super(
            icon: const RMIcon(icon: Icons.abc_rounded),
            name: "Dismantling Station",
            price: 2500,
            description:
                "Computers are dismantled to separate different components and materials.");
}

class DataWiper extends Item {
  const DataWiper()
      : super(
            icon: const RMIcon(icon: Icons.abc_rounded),
            name: "Data Wiper",
            price: 2500,
            description:
                "Wipes the data from old hard drives and other storage devices to protect sensitive information.");
}

class HazardousWasteDisposer extends Item {
  const HazardousWasteDisposer()
      : super(
            icon: const RMIcon(icon: Icons.abc_rounded),
            name: "Hazardous Waste Disposer",
            price: 2500,
            description:
                "Diposes of hazardous waste in a safe and responsible manner.");
}

class MeltingStation extends Item {
  const MeltingStation()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Melting Station",
          price: 2500,
          description:
              "Melts metals and plastics so that they can be used in new products.",
        );
}

class CostPlaceholder extends Item {
  const CostPlaceholder({required super.price})
      : super(
            icon: const RMIcon(icon: Icons.money_rounded),
            name: "Cost Placeholder");

  @override
  bool operator ==(Object other) {
    if (other is! CostPlaceholder) {
      return false;
    }

    return other.hashCode == hashCode;
  }

  @override
  int get hashCode => price;
}

class CraftingItems {
  static const shredder = Shredder();
  static const computerDismantlingStation = ComputerDismantlingStation();
  static const dataWiper = DataWiper();
  static const hazardousWasteDisposer = HazardousWasteDisposer();
  static const meltingStation = MeltingStation();

  static CostPlaceholder costPlaceholder(int cost) {
    return CostPlaceholder(price: cost);
  }
}
