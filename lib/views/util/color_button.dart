import 'package:flutter/material.dart';

import 'smooth_rectangle_border.dart';
import 'tap_scale.dart';

class ColorButton extends StatelessWidget {
  final Function() onTap;
  final Color color;
  final Color textColor;
  final String text;
  const ColorButton({
    super.key,
    this.color = Colors.black,
    required this.text,
    required this.onTap,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TapScale(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            smoothness: 1.0,
          ),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w900,
              fontSize: 28,
            ),
          ),
        ),
      ),
    );
  }
}
