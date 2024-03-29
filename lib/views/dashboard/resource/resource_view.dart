import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/util/game_state.dart';

import '../../../models/item/resource.dart';
import '../../util/linear_progress_view.dart';
import 'resource_name_view.dart';

class ResourceView extends StatefulWidget {
  final Resource resource;

  const ResourceView({
    super.key,
    required this.resource,
  });

  @override
  State<ResourceView> createState() => _ResourceViewState();
}

class _ResourceViewState extends State<ResourceView> {
  List<Widget> _buildProductionView(GameState game) {
    var productionRate = game.productionRate(widget.resource);
    var consumptionRate = game.consumptionRate(widget.resource);

    var maxRate = max(
      max(productionRate, consumptionRate),
      0.0000001,
    );

    return [
      LinearProgressView(
        leading: const Icon(
          Icons.trending_up_rounded,
          color: Colors.black87,
        ),
        color: const Color(0xFFffa100),
        progress: productionRate / maxRate,
      ),
      const SizedBox(height: 12),
      LinearProgressView(
        leading: const Icon(
          Icons.trending_down_rounded,
          color: Colors.white,
        ),
        color: Colors.deepOrange,
        progress: consumptionRate / maxRate,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResourceNameView(
          resource: widget.resource,
        ),
        const SizedBox(height: 20),
        ..._buildProductionView(game),
      ],
    );
  }
}
