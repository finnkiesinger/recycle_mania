import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/facility/storage_facility.dart';
import '../../../models/item/resource.dart';
import '../../../models/util/game_state.dart';

class StorageList extends StatelessWidget {
  final Resource resource;
  const StorageList({super.key, required this.resource});

  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();
    var storages = game.facilities
        .whereType<StorageFacility>()
        .where((f) => f.item == resource);
    return ListView(
      padding: EdgeInsets.only(
        top: 8,
        bottom: 220 + MediaQuery.of(context).viewPadding.bottom,
      ),
      children: [
        ...storages.map((e) => Text(e.name)),
      ],
    );
  }
}
