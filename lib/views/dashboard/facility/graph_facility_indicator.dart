import 'package:flutter/material.dart';

import '../../util/smooth_rectangle_border.dart';

class GraphFacilityIndicator extends StatelessWidget {
  const GraphFacilityIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 50,
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          smoothness: 1.0,
        ),
        color: Colors.cyan,
      ),
      child: const Center(
        child: Icon(
          Icons.chevron_right_rounded,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
