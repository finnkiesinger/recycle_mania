import 'package:flutter/material.dart';

import 'tap_scale.dart';

class RMTabItem extends StatelessWidget {
  final IconData? icon;
  final Function()? onTap;
  final bool active;
  final Widget? widget;
  final Color? color;

  const RMTabItem({
    super.key,
    this.icon,
    this.onTap,
    this.active = false,
    this.widget,
    this.color,
  });

  bool get static => widget != null;

  @override
  Widget build(BuildContext context) {
    return TapScale(
      onTap: onTap,
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: Icon(
            icon,
            key: ValueKey<bool>(active),
            color: active ? Colors.white : Colors.white38,
            size: 32,
          ),
        ),
      ),
    );
  }
}
