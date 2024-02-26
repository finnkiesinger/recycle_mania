import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/util/game_state.dart';

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
    return Container(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: [
          const SizedBox(width: 8),
          const Icon(
            Icons.savings_rounded,
            color: Colors.white,
            size: 28,
          ),
          Expanded(
            child: Center(
              child: Text(
                NumberFormat.compactCurrency(
                  symbol: "\$",
                  decimalDigits: 0,
                ).format(balance),
                style: const TextStyle(
                  height: 1,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
