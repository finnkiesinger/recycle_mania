import 'package:flutter/material.dart';

import 'smooth_rectangle_border.dart';
import 'tap_scale.dart';

class ActionButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function() onTap;
  final bool outline;

  const ActionButton({
    super.key,
    this.outline = false,
    required this.color,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TapScale(
          onTap: onTap,
          child: Container(
            height: 50,
            decoration: ShapeDecoration(
              shape: SmoothRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                smoothness: 1.0,
                side: outline
                    ? BorderSide(
                        color: color,
                        width: 2,
                      )
                    : BorderSide.none,
              ),
              color: !outline ? color : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
                SizedBox(
                  width: 30,
                  child: Icon(
                    icon,
                    color: outline ? color : Colors.white,
                    size: 30,
                  ),
                ),
                const Spacer(),
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: outline ? color : null,
                  ),
                ),
                const Spacer(),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ),
        const Text(""),
      ],
    );
  }
}
