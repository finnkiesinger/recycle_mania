import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

import 'clip_s_rect.dart';
import 'smooth_rectangle_border.dart';

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
          _ticker?.dispose();
          _ticker = null;
        }
        _progress = clampDouble(newProgress, 0, 1);
      });
    });
  }

  _start(_) {
    if (widget.disabled) return;

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
    return Column(
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
        const SizedBox(height: 2),
        Text(
          widget.hint,
          style: const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
