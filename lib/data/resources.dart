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
          color: const Color.fromARGB(255, 104, 144, 166),
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

const _plastic = Plastic();
const _paper = Paper();
const _organic = Organic();
const _metal = Metal();
const _glass = Glass();

const resources = [
  _paper,
  _organic,
  _glass,
  _metal,
  _plastic,
];

class Resources {
  static const plastic = _plastic;
  static const paper = _paper;
  static const glass = _glass;
  static const metal = _metal;
  static const organic = _organic;
}
