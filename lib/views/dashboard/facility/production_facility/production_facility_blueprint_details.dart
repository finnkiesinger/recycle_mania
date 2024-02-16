import 'package:flutter/material.dart';

import '../../../../models/crafting/production_facility_blueprint.dart';

class ProductionFacilityBlueprintDetails extends StatelessWidget {
  final ProductionFacilityBlueprint blueprint;
  const ProductionFacilityBlueprintDetails({
    super.key,
    required this.blueprint,
  });

  @override
  Widget build(BuildContext context) {
    return Text("Hi there!");
  }
}
