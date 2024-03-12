import 'package:flutter/material.dart';
import '../models/util/rm_icon.dart';

import '../models/item/waste.dart';

const oldComputer = Waste(
  name: "Old Computer",
  price: 20,
  icon: RMIcon(
    icon: Icons.delete_rounded,
  ),
);

const foodScraps = Waste(
  name: "Food Waste",
  price: 1,
  icon: RMIcon(
    icon: Icons.fastfood_rounded,
  ),
);

const yardWaste = Waste(
  name: "Yard Waste",
  price: 1,
  icon: RMIcon(
    icon: Icons.eco_rounded,
  ),
);

const mixedPaper = Waste(
  name: "Mixed Paper",
  price: 2,
  icon: RMIcon(
    icon: Icons.newspaper_rounded,
  ),
);

const metalScraps = Waste(
  name: "Metal Scraps",
  price: 2,
  icon: RMIcon(
    icon: Icons.menu_rounded,
  ),
);

const oldPlasticBottles = Waste(
  name: "PET Bottles",
  price: 1,
  icon: RMIcon(
    icon: Icons.liquor_rounded,
  ),
);

const oldGlassBottles = Waste(
  name: "Old Glass Bottles",
  price: 1,
  icon: RMIcon(
    icon: Icons.liquor_rounded,
  ),
);
