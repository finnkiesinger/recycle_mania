import 'package:flutter/material.dart';

import 'smooth_rectangle_border.dart';

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
        return ClipPath(
          clipper: CustomClipperProgress(
            borderRadius: 12,
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 40,
                decoration: ShapeDecoration(
                  color: color.withOpacity(0.5),
                  shape: SmoothRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    smoothness: 1.0,
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 40,
                width: constraints.maxWidth * progress,
                decoration: ShapeDecoration(
                  color: color,
                  shape: SmoothRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    smoothness: 1.0,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: leading,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: trailing,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomClipperProgress extends CustomClipper<Path> {
  final double borderRadius;

  CustomClipperProgress({required this.borderRadius});

  @override
  Path getClip(Size size) {
    return const SmoothRectangleBorder().getPath(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(borderRadius),
      ),
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}