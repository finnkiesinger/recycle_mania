import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../models/facility/production_facility.dart';
import '../../../models/util/game_state.dart';
import '../../util/bottom_dock.dart';
import '../../util/dock_element.dart';
import 'facility_list_item.dart';
import 'production_facility/production_facility_blueprint_list.dart';

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

    return Stack(
      children: [
        ShaderMask(
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
              top: 8,
              bottom: MediaQuery.of(context).viewPadding.bottom + 140,
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
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: BottomDock(
              children: [
                DockElement(
                  icon: Icons.build_rounded,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    showCupertinoModalBottomSheet(
                      context: context,
                      isDismissible: false,
                      enableDrag: false,
                      barrierColor: Colors.black38,
                      duration: const Duration(milliseconds: 250),
                      builder: (context) {
                        return const Scaffold(
                          body: ProductionFacilityBlueprintList(),
                        );
                      },
                    );
                  },
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 0, 163, 95),
                      Color.fromARGB(255, 0, 114, 67),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
