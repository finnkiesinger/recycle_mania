import 'package:flutter/material.dart';

import 'smooth_rectangle_border.dart';
import 'tap_scale.dart';

class OutlineButton extends StatelessWidget {
  final Function() onTap;
  final Color color;
  final String text;
  final Color backgroundColor;

  const OutlineButton({
    super.key,
    this.color = Colors.black,
    required this.text,
    required this.onTap,
    this.backgroundColor = Colors.transparent,
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
            side: BorderSide(
              width: 4,
              color: color,
            ),
          ),
          color: backgroundColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
