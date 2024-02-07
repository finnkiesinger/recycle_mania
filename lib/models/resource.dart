import 'package:flutter/material.dart';

class Resource {
  final IconData icon;
  final String title;
  final Color color;

  const Resource({
    required this.title,
    required this.icon,
    this.color = Colors.white,
  });
}
