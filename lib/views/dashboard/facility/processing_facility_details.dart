import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/facility/processing_facility.dart';
import '../../../models/util/game_state.dart';
import '../../util/list_header.dart';
import '../../util/list_modal.dart';

class ProcessingFacilityDetails extends StatelessWidget {
  final ProcessingFacility facility;
  const ProcessingFacilityDetails({
    super.key,
    required this.facility,
  });

  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();
    var blueprint = game.blueprints
        .firstWhere((b) => b.output.runtimeType == facility.runtimeType);

    return ListModal(
      title: facility.name,
      separated: false,
      centered: true,
      children: [
        const Header(
          text: "Description",
          top: false,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            blueprint.description ?? "",
            style: const TextStyle(
              color: Colors.white60,
            ),
          ),
        ),
        const Header(
          text: "Components",
        ),
      ],
    );
  }
}
