import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

import '../../../../models/crafting/io_facility_blueprint.dart';
import '../../../../models/facility/io_facility.dart';
import '../../../../models/util/game_state.dart';
import '../../../util/clip_s_rect.dart';
import '../../../util/smooth_rectangle_border.dart';
import '../../../util/tap_scale.dart';
import '../facility_list_item.dart';
import 'io_facility_blueprint_details.dart';

class IOFacilityBlueprintListElement extends StatelessWidget {
  final IOFacilityBlueprint blueprint;
  const IOFacilityBlueprintListElement({
    super.key,
    required this.blueprint,
  });

  @override
  Widget build(BuildContext context) {
    var facility = blueprint.output as IOFacility;
    var game = context.watch<GameState>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FacilityListItem(
          facility: facility,
          animating: false,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              _ActionButton(
                outline: true,
                icon: Icons.info_rounded,
                text: "MORE",
                color: Colors.white,
                onTap: () {
                  HapticFeedback.lightImpact();
                  showCupertinoModalBottomSheet(
                    context: context,
                    enableDrag: false,
                    isDismissible: false,
                    barrierColor: Colors.black38,
                    duration: const Duration(milliseconds: 250),
                    builder: (context) {
                      return Scaffold(
                        body: IOFacilityBlueprintDetails(
                          blueprint: blueprint,
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(width: 16),
              ChargeButton(
                  icon: Icons.build_circle_rounded,
                  text: "BUILD",
                  color: const Color.fromARGB(255, 0, 163, 95),
                  chargeColor: const Color.fromARGB(255, 0, 114, 67),
                  disabled: !game.fulfillsRequirementsFor(blueprint),
                  onTap: () {
                    game.buildFacility(blueprint);
                    HapticFeedback.lightImpact();
                    Navigator.pop(context);
                  },
                  chargeTime: 1.0,
                  hint:
                      "Cost: \$${NumberFormat.decimalPattern(Localizations.localeOf(context).toString()).format(blueprint.cost)}"),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function() onTap;
  final bool outline;

  const _ActionButton({
    this.outline = false,
    required this.color,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TapScale(
            onTap: onTap,
            child: Container(
              height: 50,
              decoration: ShapeDecoration(
                shape: SmoothRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  smoothness: 1.0,
                  side: outline
                      ? BorderSide(
                          color: color,
                          width: 2,
                        )
                      : BorderSide.none,
                ),
                color: !outline ? color : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 30,
                    child: Icon(
                      icon,
                      color: outline ? color : Colors.white,
                      size: 30,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: outline ? color : null,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ),
          const Text(""),
        ],
      ),
    );
  }
}

class ChargeButton extends StatefulWidget {
  final Color color;
  final Color chargeColor;
  final IconData icon;
  final String text;
  final Function() onTap;
  final String hint;
  final double chargeTime;
  final bool disabled;

  const ChargeButton({
    super.key,
    required this.color,
    required this.chargeColor,
    required this.chargeTime,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.disabled,
    this.hint = "",
  });

  @override
  State<ChargeButton> createState() => _ChargeButtonState();
}

class _ChargeButtonState extends State<ChargeButton>
    with TickerProviderStateMixin {
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

  var _down = false;
  var _progress = 0.0;
  Ticker? _ticker;

  @override
  void initState() {
    super.initState();

    _ticker = createTicker((elapsed) {
      setState(() {
        var newProgress = elapsed.inMilliseconds / (widget.chargeTime * 1000);
        if (newProgress >= 1) {
          widget.onTap();
        }
        _progress = clampDouble(newProgress, 0, 1);
      });
    });
  }

  _start(_) {
    if (widget.disabled) return;
    print("start");

    setState(() {
      _down = true;
    });
    Vibration.vibrate(
      pattern: List.generate(254, (index) => widget.chargeTime * 1000 ~/ 254),
      intensities: List.generate(254, (index) => min(255, index + 1) ~/ 8),
    );
    _ticker?.start();
  }

  _stop(_) async {
    if (widget.disabled) return;

    setState(() {
      _down = false;

      Vibration.cancel();
      if (_progress < 0.05) {
        HapticFeedback.mediumImpact();
        tooltipkey.currentState?.ensureTooltipVisible();
      }
      _progress = 0.0;
    });
    _ticker?.stop();
  }

  @override
  void dispose() {
    Vibration.cancel();
    _ticker?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Tooltip(
            key: tooltipkey,
            decoration: ShapeDecoration(
              shape: SmoothRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                smoothness: 1.0,
                side: const BorderSide(width: 2, color: Colors.white),
              ),
              color: widget.color,
              shadows: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 16,
                ),
              ],
            ),
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            message: "Hold down",
            triggerMode: TooltipTriggerMode.manual,
            child: GestureDetector(
              onTapDown: _start,
              onTapUp: _stop,
              onTapCancel: () {
                _stop(null);
              },
              child: AnimatedScale(
                duration: const Duration(milliseconds: 100),
                scale: _down ? 0.95 : 1,
                child: ClipSRect(
                  radius: 12,
                  child: Stack(
                    children: [
                      Container(
                        height: 50,
                        color: widget.disabled ? Colors.grey : widget.color,
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            height: 50,
                            width: constraints.maxWidth *
                                Curves.easeOutCubic.transform(_progress),
                            decoration: BoxDecoration(
                              color: widget.chargeColor,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 16),
                            SizedBox(
                              width: 30,
                              child: Icon(
                                widget.icon,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              widget.text,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            const SizedBox(width: 16),
                          ],
                        ),
                      ),
                      if (widget.disabled)
                        Container(
                          height: 50,
                          color: Colors.black54,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Text(
            widget.hint,
            style: const TextStyle(
              color: Colors.white38,
            ),
          ),
        ],
      ),
    );
  }
}
