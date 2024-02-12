import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'smooth_rectangle_border.dart';

class BottomDock extends StatelessWidget {
  final List<Widget> children;
  const BottomDock({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: ShapeDecoration(
            color: const Color.fromARGB(255, 50, 50, 50),
            shape: SmoothRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              smoothness: 0.8,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...children.mapIndexed((index, child) {
                return Row(children: [
                  child,
                  if (index < children.length - 1) const SizedBox(width: 8),
                ]);
              }),
            ],
          ),
        ),
      ],
    );
  }
}
