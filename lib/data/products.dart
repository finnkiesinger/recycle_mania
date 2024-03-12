import 'package:flutter/material.dart';

import '../models/item/product.dart';
import '../models/util/rm_icon.dart';

class Computer extends Product {
  const Computer()
      : super(
          icon: const RMIcon(
            icon: Icons.computer_rounded,
          ),
          name: "Computer",
          price: 600,
          color: const Color.fromARGB(255, 70, 71, 93),
        );
}

class CompostBag extends Product {
  const CompostBag()
      : super(
          icon: const RMIcon(icon: Icons.luggage_rounded),
          name: "Compost Bag",
          price: 25,
          color: Colors.greenAccent,
        );
}

class PaperStack extends Product {
  const PaperStack()
      : super(
          icon: const RMIcon(icon: Icons.menu_rounded),
          name: "Paper Stack",
          price: 50,
          color: Colors.brown,
        );
}

class GlassBottle extends Product {
  const GlassBottle()
      : super(
          icon: const RMIcon(icon: Icons.wine_bar_rounded),
          name: "Glass Bottle",
          price: 10,
          color: Colors.indigo,
        );
}

class Nails extends Product {
  const Nails()
      : super(
          icon: const RMIcon(icon: Icons.hardware_rounded),
          name: "Nails",
          price: 10,
          color: Colors.black,
        );
}

class Products {
  static const computer = Computer();
  static const compostBag = CompostBag();
  static const paperStack = PaperStack();
  static const glassBottle = GlassBottle();
}
