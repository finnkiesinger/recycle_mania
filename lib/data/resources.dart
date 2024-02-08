import 'package:flutter/material.dart';

import '../models/util/rm_icon.dart';
import '../models/item/resource.dart';

class Plastic extends Resource {
  const Plastic()
      : super(
          color: const Color(0xFFFF3D5A),
          name: "Plastic",
          icon: const RMIcon(
            icon: Icons.recycling_rounded,
          ),
          price: 100,
        );
}

class Paper extends Resource {
  const Paper()
      : super(
          color: Colors.deepOrangeAccent,
          name: "Paper",
          icon: const RMIcon(
            icon: Icons.note_rounded,
          ),
          price: 1,
        );
}

class Organic extends Resource {
  const Organic()
      : super(
          name: "Organic",
          icon: const RMIcon(
            icon: Icons.compost_rounded,
          ),
          color: Colors.lightGreen,
          price: 4,
        );
}

class Metal extends Resource {
  const Metal()
      : super(
          name: "Metal",
          icon: const RMIcon(
            icon: Icons.table_rows_rounded,
          ),
          color: Colors.blueGrey,
          price: 50,
        );
}

class Glass extends Resource {
  const Glass()
      : super(
          name: "Glass",
          icon: const RMIcon(
            icon: Icons.liquor_rounded,
          ),
          color: Colors.cyan,
          price: 22,
        );
}

const plastic = Plastic();
const paper = Paper();
const organic = Organic();
const metal = Metal();
const glass = Glass();

const resources = [
  paper,
  organic,
  glass,
  metal,
  plastic,
];
