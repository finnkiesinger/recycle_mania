import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/util/game_state.dart';

import '../util/smooth_rectangle_border.dart';

class BalanceView extends StatefulWidget {
  const BalanceView({super.key});

  @override
  State<BalanceView> createState() => _BalanceViewState();
}

var baseColor = Colors.blue;

class _BalanceViewState extends State<BalanceView> {
  @override
  Widget build(BuildContext context) {
    var balance = context.watch<GameState>().money;
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: 40,
          width: 150,
          decoration: ShapeDecoration(
            color: baseColor.withOpacity(0.8),
            shape: SmoothRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              smoothness: 1.0,
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 48),
              const Spacer(),
              Text(
                NumberFormat.compactCurrency(
                  symbol: "\$",
                  decimalDigits: 0,
                ).format(balance),
                style: const TextStyle(
                  height: 1,
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 12),
              const Spacer(),
            ],
          ),
        ),
        Container(
          width: 48,
          height: 48,
          decoration: ShapeDecoration(
            color: baseColor,
            shape: SmoothRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              smoothness: 1.0,
            ),
          ),
          child: const Icon(
            Icons.savings_rounded,
            color: Colors.white,
            size: 28,
          ),
        ),
      ],
    );
  }
}
