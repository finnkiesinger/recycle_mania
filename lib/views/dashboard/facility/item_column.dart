import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../../../models/item/product.dart';
import '../../../models/item/resource.dart';
import '../../../models/util/io.dart';
import '../../util/smooth_rectangle_border.dart';
import 'processing_view.dart';

class ItemColumn extends StatelessWidget {
  final List<IO> io;

  const ItemColumn({
    super.key,
    required this.io,
  });

  Widget _buildNode(IO io) {
    final item = io.item;
    Color color = Colors.red;
    Widget? child;

    if (item is Resource) {
      color = item.color;
    }

    if (item is Product) {
      color = item.color ?? color;
    }

    if (item.icon.icon != null) {
      child = Icon(
        item.icon.icon,
        color: Colors.white,
        size: 32,
      );
    } else if (item.icon.widget != null) {
      child = item.icon.widget;
    }

    return Tooltip(
      message: "${item.name} x${io.amount}",
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          smoothness: 1.0,
          side: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        shadows: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 16,
          ),
        ],
        color: color,
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      triggerMode: TooltipTriggerMode.tap,
      child: badges.Badge(
        position: badges.BadgePosition.bottomEnd(),
        showBadge: io.amount > 1,
        badgeContent: Text(
          "x${io.amount}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        badgeStyle: badges.BadgeStyle(
          shape: badges.BadgeShape.square,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          borderRadius: BorderRadius.circular(8),
          badgeColor: color,
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...io.map(
          (io) => SizedBox(
            height: processViewNodeHeight,
            width: 80,
            child: Center(
              child: _buildNode(io),
            ),
          ),
        ),
      ],
    );
  }
}
