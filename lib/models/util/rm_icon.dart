import 'package:flutter/cupertino.dart';

class RMIcon {
  final IconData? icon;
  final Widget? widget;

  const RMIcon({this.icon, this.widget})
      : assert(
          (icon != null || widget != null) && !(icon != null && widget != null),
          "RMIcon must contain either a widget or an icon",
        );
}
