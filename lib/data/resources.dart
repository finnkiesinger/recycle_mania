import 'package:flutter/material.dart';

import '../models/item/resource.dart';

const plastic = Resource(
  name: "Plastic",
  icon: Icons.recycling_rounded,
  color: Color(0xFFFF3D5A),
);

const paper = Resource(
  name: "Paper",
  icon: Icons.note_rounded,
  color: Colors.deepOrangeAccent,
);

const organic = Resource(
  name: "Organic",
  icon: Icons.compost_rounded,
  color: Colors.lightGreen,
);

const metal = Resource(
  name: "Metal",
  icon: Icons.table_rows_rounded,
  color: Colors.blueGrey,
);

const glass = Resource(
  name: "Glass",
  icon: Icons.liquor_rounded,
  color: Colors.cyan,
);

const resources = [
  paper,
  organic,
  glass,
  metal,
  plastic,
];
