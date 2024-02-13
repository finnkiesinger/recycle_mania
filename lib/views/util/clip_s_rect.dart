import 'package:flutter/widgets.dart';

import 'smooth_rectangle_border.dart';

class ClipSRect extends StatelessWidget {
  final double radius;
  final Widget child;
  const ClipSRect({
    super.key,
    required this.radius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SmoothRectangleClipper(
        borderRadius: radius,
      ),
      child: child,
    );
  }
}

class SmoothRectangleClipper extends CustomClipper<Path> {
  final double borderRadius;

  SmoothRectangleClipper({required this.borderRadius});

  @override
  Path getClip(Size size) {
    return SmoothRectangleBorder(
      smoothness: 1.0,
      borderRadius: BorderRadius.circular(borderRadius),
    ).getPath(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(borderRadius),
      ),
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
