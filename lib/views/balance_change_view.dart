import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceChangeView extends StatefulWidget {
  const BalanceChangeView({super.key});

  @override
  State<BalanceChangeView> createState() => _BalanceChangeViewState();
}

Color? getColor(double roc, {double base = 1000}) {
  return roc > 0 ? Colors.green : Colors.red;
}

class _BalanceChangeViewState extends State<BalanceChangeView> {
  double get _roc => 500;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          height: 40,
          width: 150,
          decoration: BoxDecoration(
            color: getColor(_roc)?.withOpacity(0.6),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              const Spacer(),
              Text(
                NumberFormat.compactCurrency(
                  symbol: "\$",
                  decimalDigits: 0,
                ).format(_roc),
                style: const TextStyle(
                  height: 1,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 48),
              const Spacer(),
            ],
          ),
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: getColor(_roc),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.currency_exchange_rounded,
            color: Colors.white,
            size: 28,
          ),
        ),
      ],
    );
  }
}
