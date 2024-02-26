import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

import '../../../models/facility/storage_facility.dart';
import '../../../models/item/resource.dart';
import '../../../models/util/game_state.dart';
import '../../util/empty_list_placeholder.dart';
import '../../util/linear_progress_view.dart';
import '../../util/tap_scale.dart';
import '../facility/storage_facility_details.dart';

class StorageList extends StatelessWidget {
  final Resource resource;
  const StorageList({super.key, required this.resource});

  Widget _buildStorageView(
    GameState game,
    List<StorageFacility> storages,
    int index,
  ) {
    List<StorageFacility> prevStorages = storages.sublist(0, index);

    int alreadyStored = 0;

    if (prevStorages.isNotEmpty) {
      alreadyStored = prevStorages
          .map((s) => s.capacity)
          .reduce((value, element) => element + value);
    }

    var capacity = storages[index].capacity;

    var stored =
        min(max((game.storage[resource] ?? 0) - alreadyStored, 0), capacity);

    var fillPercentage = stored / max(capacity, 1);

    return LinearProgressView(
      leading: const Icon(
        Icons.warehouse_rounded,
        color: Colors.white,
      ),
      trailing: Text("$stored / $capacity"),
      color: Colors.cyan,
      progress: fillPercentage,
    );
  }

  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();
    var storages = game.facilities
        .whereType<StorageFacility>()
        .where((f) => f.item == resource)
        .toList();
    return Stack(
      children: [
        if (storages.isEmpty) const EmptyStorageFacilityListPlaceholder(),
        if (storages.isNotEmpty)
          ListView(
            padding: EdgeInsets.only(
              top: 16,
              bottom: 220 + MediaQuery.of(context).viewPadding.bottom,
            ),
            children: [
              ...storages.mapIndexed((index, storage) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0).copyWith(
                    bottom: 16,
                  ),
                  child: TapScale(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      showCupertinoModalBottomSheet(
                          context: context,
                          enableDrag: false,
                          duration: const Duration(milliseconds: 250),
                          builder: (context) {
                            return Scaffold(
                              body: StorageFacilityDetails(facility: storage),
                            );
                          });
                    },
                    child: _buildStorageView(game, storages, index),
                  ),
                );
              }),
            ],
          ),
      ],
    );
  }
}
