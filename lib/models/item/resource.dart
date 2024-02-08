import 'package:flutter/material.dart';
import 'package:recycle_mania/models/item/item.dart';

class Resource extends Item {
  final IconData icon;
  final Color color;

  const Resource({
    required super.name,
    required this.icon,
    this.color = Colors.white,
  });
}
