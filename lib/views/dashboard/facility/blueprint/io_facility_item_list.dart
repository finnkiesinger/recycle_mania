import 'package:flutter/material.dart';

import '../../../../models/item/product.dart';
import '../../../../models/item/resource.dart';
import '../../../../models/util/io.dart';
import '../../../util/smooth_rectangle_border.dart';

class IOFacilityItemList extends StatelessWidget {
  final List<IO> io;
  const IOFacilityItemList({
    super.key,
    required this.io,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: [
        ...io.map(
          (o) {
            Color color = Colors.red;
            var item = o.item;

            if (item is Resource) {
              color = item.color;
            }

            if (item is Product) {
              color = item.color ?? color;
            }

            return Container(
              height: 30,
              decoration: ShapeDecoration(
                color: color,
                shape: SmoothRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  smoothness: 1.0,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 16),
                  Text(
                    o.item.name,
                  ),
                  if (o.amount > 1) ...[
                    const SizedBox(width: 8),
                    Text(
                      "x${o.amount}",
                    ),
                  ],
                  const SizedBox(width: 4),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
