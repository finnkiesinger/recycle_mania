import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/facility/io_facility.dart';
import '../../../models/facility/processing_facility.dart';
import '../../../models/facility/production_facility.dart';
import '../../util/smooth_rectangle_border.dart';

class GraphFacilityIndicator extends StatelessWidget {
  final IOFacility facility;
  const GraphFacilityIndicator({
    super.key,
    required this.facility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.settings_rounded,
              color: Colors.white38,
              size: 18,
            ),
            const SizedBox(width: 4),
            Text(
              "${facility.time}s",
              style: const TextStyle(
                color: Colors.white38,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Container(
          width: 80,
          height: 50,
          decoration: ShapeDecoration(
            shape: SmoothRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              smoothness: 1.0,
            ),
            color: Colors.cyan,
          ),
          child: Center(
            child: Builder(
              builder: (context) {
                var cost = facility.cost * (facility.time + facility.cooldown);
                if (facility is ProcessingFacility) {
                  cost += (facility as ProcessingFacility).inputCost;
                } else if (facility is ProductionFacility) {}
                return Text(
                  "\$${NumberFormat.compact().format(cost)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.hourglass_bottom_rounded,
              color: Colors.white38,
              size: 18,
            ),
            const SizedBox(width: 4),
            Text(
              "${facility.cooldown}s",
              style: const TextStyle(
                color: Colors.white38,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
