import 'package:flutter/material.dart';

import 'smooth_rectangle_border.dart';
import 'tap_scale.dart';

class DockElement extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  final Color foregroundColor;
  final Color? backgroundColor;
  final Gradient? gradient;

  const DockElement({
    super.key,
    required this.icon,
    required this.onTap,
    this.foregroundColor = Colors.white,
    this.backgroundColor,
    this.gradient,
  }) : assert(gradient != null || backgroundColor != null,
            "The icon must have either a background color or gradient");

  @override
  Widget build(BuildContext context) {
    return TapScale(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            smoothness: 0.8,
          ),
          gradient: gradient,
          color: backgroundColor,
        ),
        child: const Icon(
          Icons.build_rounded,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
