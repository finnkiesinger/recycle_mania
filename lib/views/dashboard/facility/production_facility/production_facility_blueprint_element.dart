import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../models/crafting/production_facility_blueprint.dart';
import 'production_facility_blueprint_details.dart';

class ProductionFacilityBlueprintElement extends StatelessWidget {
  final ProductionFacilityBlueprint blueprint;
  const ProductionFacilityBlueprintElement({
    super.key,
    required this.blueprint,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalBottomSheet(
          context: context,
          duration: const Duration(milliseconds: 250),
          builder: (context) {
            return Scaffold(
              body: ProductionFacilityBlueprintDetails(
                blueprint: blueprint,
              ),
            );
          },
        );
      },
      child: Container(
        height: 50,
        child: Text("Hi there"),
      ),
    );
  }
}
