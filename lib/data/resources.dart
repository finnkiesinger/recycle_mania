import 'package:flutter/material.dart';

import '../models/resource.dart';

const plastic = Resource(
  title: "Plastic",
  icon: Icons.recycling_rounded,
  color: Colors.blueGrey,
);

const paper = Resource(
  title: "Paper",
  icon: Icons.note_rounded,
  color: Colors.deepOrangeAccent,
);

const organic = Resource(
  title: "Organic",
  icon: Icons.compost_rounded,
  color: Colors.lightGreen,
);

const metal = Resource(
  title: "Metal",
  icon: Icons.table_rows_rounded,
  color: Colors.grey,
);

const glass = Resource(
  title: "Glass",
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
