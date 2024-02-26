import 'package:flutter/material.dart';
import '../../util/smooth_rectangle_border.dart';

class PipelineHeader extends StatelessWidget {
  final String title;
  final Color color;

  const PipelineHeader({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 80,
      decoration: ShapeDecoration(
        color: color,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          smoothness: 1.0,
        ),
      ),
      child: Center(
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
