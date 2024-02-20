import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../../models/facility/io_facility.dart';
import '../../../models/util/game_state.dart';

import '../../game_view.dart';
import '../../util/smooth_rectangle_border.dart';

class ProgressView extends StatefulWidget {
  final IOFacility facility;

  const ProgressView({
    super.key,
    required this.facility,
  });

  @override
  State<ProgressView> createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView> {
  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();

    return GestureDetector(
      onTap: () {
        context.read<GameState>().togglePause(widget.facility);
        HapticFeedback.lightImpact();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 80,
        height: 50,
        decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            smoothness: 1.0,
          ),
          color: widget.facility.active && !widget.facility.paused
              ? Colors.cyan
              : Colors.grey,
        ),
        child: Center(
          child: CircularPercentIndicator(
            radius: 18,
            animation: true,
            animateFromLastPercent: true,
            animationDuration: baseUpdateTime ~/ game.timeMultiplier,
            lineWidth: 3,
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Colors.white24,
            progressColor: Colors.white,
            percent: clampDouble(
                widget.facility.progress + 1 / widget.facility.currentTime,
                0,
                1),
            center: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(animation),
                  child: ScaleTransition(
                    scale: Tween<double>(
                      begin: 0,
                      end: 1,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: Icon(
                widget.facility.active && !widget.facility.paused
                    ? Icons.settings_rounded
                    : (widget.facility.coolingDown && !widget.facility.paused
                        ? Icons.hourglass_bottom_rounded
                        : Icons.pause_rounded),
                color: Colors.white,
                key: ValueKey<String>(
                  widget.facility.active && !widget.facility.paused
                      ? "active"
                      : (widget.facility.coolingDown && !widget.facility.paused
                          ? "cooldown"
                          : "paused"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
