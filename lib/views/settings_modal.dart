import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../data/presets.dart';
import '../models/util/game_state.dart';
import 'util/list_modal.dart';
import 'util/smooth_rectangle_border.dart';
import 'util/tap_scale.dart';

class SettingsModal extends StatelessWidget {
  const SettingsModal({super.key});

  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();

    return ListModal(
      title: "Settings",
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Developer",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Switch Preset",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        ...Presets.development.mapIndexed(
                          (index, preset) => Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: TapScale(
                                    onTap: () {
                                      game.loadPreset(preset);
                                      HapticFeedback.lightImpact();
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 60,
                                      decoration: ShapeDecoration(
                                        shape: SmoothRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          smoothness: 1.0,
                                        ),
                                        color: const Color.fromARGB(
                                            255, 50, 50, 50),
                                      ),
                                      child: Center(
                                        child: Text(
                                          preset.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (index < Presets.development.length - 1)
                                  const SizedBox(width: 8)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
