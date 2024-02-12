import 'package:flutter/material.dart';

import '../../../../models/facility/io_facility.dart';
import '../../../util/smooth_rectangle_border.dart';
import '../../../util/tap_scale.dart';

class IOFacilityBlueprintDetails extends StatelessWidget {
  final IOFacility facility;
  const IOFacilityBlueprintDetails({
    super.key,
    required this.facility,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.zero,
          children: [
            Row(
              children: [
                Text(facility.name),
              ],
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              TapScale(
                onTap: Navigator.of(context).pop,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: ShapeDecoration(
                    shape: SmoothRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      smoothness: 1.0,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
