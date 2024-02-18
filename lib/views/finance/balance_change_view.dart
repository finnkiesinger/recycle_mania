import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/util/game_state.dart';

class BalanceChangeView extends StatefulWidget {
  const BalanceChangeView({super.key});

  @override
  State<BalanceChangeView> createState() => _BalanceChangeViewState();
}

Color? getColor(double roc, {double base = 1000}) {
  return roc > 0 ? Colors.green : Colors.red;
}

class _BalanceChangeViewState extends State<BalanceChangeView> {
  @override
  Widget build(BuildContext context) {
    var roc = context.watch<GameState>().activeCost;
    return Container(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: [
          const SizedBox(
            width: 50,
            child: Center(
              child: Icon(
                Icons.currency_exchange_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
          Expanded(
            child: Text(
              NumberFormat.compactCurrency(
                symbol: "\$",
                decimalDigits: 0,
              ).format(roc),
              style: const TextStyle(
                height: 1,
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
