import 'package:flutter/material.dart';

class LinearProgressView extends StatelessWidget {
  final Widget leading;
  final Widget? trailing;
  final Color color;
  final double progress;

  const LinearProgressView({
    super.key,
    required this.leading,
    required this.color,
    required this.progress,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Container(
              height: 40,
              width: constraints.maxWidth * progress,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: leading,
            ),
          ],
        );
      },
    );
  }
}
