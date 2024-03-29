import 'package:flutter/material.dart';
import 'item.dart';

class Resource extends Item {
  final Color color;

  const Resource({
    required super.name,
    required super.price,
    required super.icon,
    this.color = Colors.white,
  });
}
