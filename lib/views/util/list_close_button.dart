import 'package:flutter/material.dart';

import 'smooth_rectangle_border.dart';
import 'tap_scale.dart';

class ListCloseButton extends StatelessWidget {
  final Function() onTap;
  const ListCloseButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TapScale(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            smoothness: 1.0,
            side: const BorderSide(
              color: Color(0xFF888888),
              width: 2,
            ),
          ),
          color: const Color.fromARGB(255, 50, 50, 50),
        ),
        child: const Icon(
          Icons.close_rounded,
          color: Color(0xFF888888),
          size: 42,
        ),
      ),
    );
  }
}
