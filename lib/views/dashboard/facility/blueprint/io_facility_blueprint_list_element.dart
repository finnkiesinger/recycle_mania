import 'package:flutter/material.dart';

import '../../../../models/crafting/io_facility_blueprint.dart';
import '../../../../models/facility/io_facility.dart';
import '../facility_list_item.dart';

class IOFacilityBlueprintListElement extends StatelessWidget {
  final IOFacilityBlueprint blueprint;
  const IOFacilityBlueprintListElement({
    super.key,
    required this.blueprint,
  });

  @override
  Widget build(BuildContext context) {
    var facility = blueprint.output as IOFacility;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   facility.name,
        //   style: const TextStyle(
        //     fontSize: 20,
        //   ),
        // ),
        // const SizedBox(height: 8),
        // const Text("Output:"),
        // IOFacilityItemList(io: facility.input),
        FacilityListItem(
          facility: facility,
          animating: false,
        ),
      ],
    );
  }
}
