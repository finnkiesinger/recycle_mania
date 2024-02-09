import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:recycle_mania/models/util/game_state.dart';

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
  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();
    var productionRate = game.productionRate(widget.resource);
    var consumptionRate = game.consumptionRate(widget.resource);

    var maxRate = max(
      max(productionRate, consumptionRate),
      0.0000001,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResourceNameView(
          resource: widget.resource,
        ),
        const SizedBox(height: 24),
        const LinearProgressView(
          leading: Icon(
            Icons.warehouse_rounded,
            color: Colors.white,
          ),
          color: Colors.cyan,
          progress: 0.2,
        ),
        const SizedBox(height: 20),
        LinearProgressView(
          leading: const Icon(
            Icons.trending_up_rounded,
            color: Colors.black87,
          ),
          trailing: consumptionRate > 0.0
              ? Text(
                  NumberFormat.percentPattern()
                      .format(productionRate / consumptionRate),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                )
              : null,
          color: const Color(0xFFffa100),
          progress: productionRate / maxRate,
        ),
        const SizedBox(height: 12),
        LinearProgressView(
          leading: const Icon(
            Icons.trending_down_rounded,
            color: Colors.white,
          ),
          trailing: productionRate > 0.0
              ? Text(
                  NumberFormat.percentPattern()
                      .format(consumptionRate / productionRate),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black87,
                        blurRadius: 12,
                      ),
                    ],
                  ),
                )
              : null,
          color: Colors.deepOrange,
          progress: consumptionRate / maxRate,
        ),
      ],
    );
  }
}
