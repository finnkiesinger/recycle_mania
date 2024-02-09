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
          price: 300,
          color: const Color.fromARGB(255, 70, 71, 93),
        );
}

class Products {
  static final computer = Computer();
}
