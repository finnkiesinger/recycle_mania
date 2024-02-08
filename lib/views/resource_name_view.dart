import 'package:flutter/material.dart';
import 'package:recycle_mania/models/item/resource.dart';

class ResourceNameView extends StatelessWidget {
  final Resource resource;

  const ResourceNameView({super.key, required this.resource});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      width: 120,
      decoration: BoxDecoration(
        color: resource.color,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(width: 2.0, color: Colors.white),
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
