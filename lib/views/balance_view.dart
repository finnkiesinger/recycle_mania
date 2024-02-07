import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceView extends StatefulWidget {
  const BalanceView({super.key});

  @override
  State<BalanceView> createState() => _BalanceViewState();
}

var baseColor = Colors.blue;

class _BalanceViewState extends State<BalanceView> {
  double get _balance => 50000;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: 40,
          width: 150,
          decoration: BoxDecoration(
            color: baseColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              const SizedBox(width: 48),
              const Spacer(),
              Text(
                NumberFormat.compactCurrency(
                  symbol: "\$",
                ).format(_balance),
                style: const TextStyle(
                  height: 1,
                  color: Colors.white,
                  fontSize: 20,
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
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(16),
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
