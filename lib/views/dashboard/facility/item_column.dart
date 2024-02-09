import 'package:flutter/material.dart';

import '../../../models/item/item.dart';
import '../../../models/item/resource.dart';
import '../../../models/util/io.dart';
import 'processing_view.dart';

class ItemColumn extends StatelessWidget {
  final List<IO> io;

  const ItemColumn({
    super.key,
    required this.io,
  });

  Widget _buildNode(Item item) {
    Color color = Colors.red;
    Widget? child;

    if (item is Resource) {
      color = item.color;
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

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: child,
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
              child: SizedBox(
                height: 60,
                width: 60,
                child: _buildNode(io.item),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
