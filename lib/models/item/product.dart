import 'dart:ui';

import 'item.dart';

class Product extends Item {
  final Color? color;

  const Product({
    required super.name,
    required super.price,
    required super.icon,
    this.color,
  });
}
