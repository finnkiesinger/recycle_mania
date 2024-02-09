
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      ],
    );
  }
}
