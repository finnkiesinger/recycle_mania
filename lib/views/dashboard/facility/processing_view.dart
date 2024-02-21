import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../util/bottom_dock.dart';
import '../../util/dock_element.dart';
import '../../util/tap_scale.dart';
import 'facility_list_item.dart';
import '../../../models/facility/processing_facility.dart';
import '../../../models/util/game_state.dart';
import 'processing_blueprint/processing_blueprint_list.dart';
import 'processing_facility_details.dart';

const processViewNodeHeight = 80.0;

class ProcessingView extends StatefulWidget {
  const ProcessingView({super.key});

  @override
  State<ProcessingView> createState() => _ProcessingViewState();
}

class _ProcessingViewState extends State<ProcessingView> {
  @override
  Widget build(BuildContext context) {
    var processors = context
        .watch<GameState>()
        .facilities
        .whereType<ProcessingFacility>()
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
              var processor = processors[index];

              return Stack(
                children: [
                  FacilityListItem(facility: processor),
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0, top: 8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TapScale(
                        onTap: () {
                          HapticFeedback.lightImpact();
                          showCupertinoModalBottomSheet(
                            context: context,
                            enableDrag: false,
                            duration: const Duration(milliseconds: 250),
                            builder: (context) => Scaffold(
                              body: ProcessingFacilityDetails(
                                facility: processor,
                              ),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.settings_rounded,
                          size: 32,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                  ),
                ],
              );
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
            itemCount: processors.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: BottomDock(
              children: [
                DockElement(
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
                          body: ProcessingBlueprintList(),
                        );
                      },
                    );
                  },
                  icon: Icons.build_rounded,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 0, 163, 95),
                      Color.fromARGB(255, 0, 114, 67),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
