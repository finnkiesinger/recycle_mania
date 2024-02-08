import 'package:flutter/material.dart';
import 'package:recycle_mania/models/item/resource.dart';

import '../util/smooth_rectangle_border.dart';

class ResourceNameView extends StatelessWidget {
  final Resource resource;

  const ResourceNameView({super.key, required this.resource});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      width: 120,
      decoration: ShapeDecoration(
        color: resource.color,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          smoothness: 1.0,
          side: const BorderSide(width: 2.0, color: Colors.white),
        ),
      ),
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: Tween<double>(
                begin: 0,
                end: 1,
              ).animate(animation),
              child: child,
            );
          },
          child: Text(
            resource.name,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
              height: 1,
            ),
            key: ValueKey<String>(resource.name),
          ),
        ),
      ),
    );
  }
}
