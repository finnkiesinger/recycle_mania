import 'package:flutter/material.dart';

import '../models/item/item.dart';
import '../models/util/rm_icon.dart';

class Shredder extends Item {
  const Shredder()
      : super(
          icon: const RMIcon(icon: Icons.abc_rounded),
          name: "Shredder",
          price: 2500,
        );
}

class CraftingItems {
  static const shredder = Shredder();
}
