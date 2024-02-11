import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../util/bottom_dock.dart';
import '../../util/dock_element.dart';
import '../../util/modal_stack.dart';
import '../../util/smooth_rectangle_border.dart';
import '../../util/tap_scale.dart';
import 'facility_list_item.dart';
import '../../../models/facility/processing_facility.dart';
import '../../../models/util/game_state.dart';

const processViewNodeHeight = 72.0;

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
              bottom: 100,
            ),
            itemBuilder: (context, index) {
              var processor = processors[index];

              return FacilityListItem(facility: processor);
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
          padding: EdgeInsets.only(
            bottom: 16 + MediaQuery.of(context).viewPadding.bottom,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: BottomDock(
              children: [
                DockElement(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    ModalStack.of(context).showSheet(
                      RMSheet(
                        child: Column(
                          children: [
                            const Expanded(
                              child: Text("Hi there"),
                            ),
                            SafeArea(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: TapScale(
                                  onTap: () {
                                    ModalStack.of(context).pop();
                                    HapticFeedback.lightImpact();
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          decoration: ShapeDecoration(
                                            shape: SmoothRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              smoothness: 1.0,
                                            ),
                                            color: const Color(0xFF3C3C3C),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "CLOSE",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
