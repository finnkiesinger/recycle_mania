import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/facility/production_facility.dart';
import '../../../models/util/game_state.dart';
import 'facility_list_item.dart';

class ProductionView extends StatefulWidget {
  const ProductionView({super.key});

  @override
  State<ProductionView> createState() => _ProductionViewState();
}

class _ProductionViewState extends State<ProductionView> {
  @override
  Widget build(BuildContext context) {
    var producers = context
        .watch<GameState>()
        .facilities
        .whereType<ProductionFacility>()
        .toList();

    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.white],
          stops: [0.8, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstOut,
      child: ListView.separated(
        padding: EdgeInsets.zero.copyWith(
          bottom: 100,
        ),
        itemBuilder: (context, index) {
          var producer = producers[index];

          return FacilityListItem(facility: producer);
        },
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: Container(
                height: 2,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
            ),
          );
        },
        itemCount: producers.length,
      ),
    );
  }
}
