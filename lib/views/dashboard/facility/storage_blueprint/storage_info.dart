import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../models/crafting/blueprint.dart';
import '../../../../models/facility/storage_facility.dart';
import '../../../../models/item/item.dart';
import '../../../../models/item/product.dart';
import '../../../../models/item/resource.dart';

class StorageInfo extends StatelessWidget {
  final Blueprint blueprint;
  final bool showTitle;

  const StorageInfo({
    super.key,
    required this.blueprint,
    this.showTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    var facility = blueprint.output as StorageFacility;

    Item item = facility.item;

    Widget icon;

    if (item.icon.icon != null) {
      icon = Icon(
        item.icon.icon,
        color: Colors.white,
        size: 32,
      );
    } else {
      icon = item.icon.widget!;
    }

    Color color = Colors.black;

    if (item is Resource) {
      color = item.color;
    } else if (item is Product) {
      color = item.color ?? color;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        badges.Badge(
          position: badges.BadgePosition.bottomEnd(),
          badgeContent: Text(
            "x${facility.capacity}",
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
            child: icon,
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showTitle)
                Text(
                  "${item.name} Storage",
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                  ),
                ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Text(
                    "Construction Cost:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "\$${blueprint.cost}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Text(
                    "Operating Cost:",
                    style: TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  Text("\$${facility.cost}/s"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
