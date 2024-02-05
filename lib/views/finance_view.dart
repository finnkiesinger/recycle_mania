import 'package:flutter/material.dart';
import 'package:recycle_mania/views/balance_view.dart';

import 'balance_change_view.dart';

class FinanceView extends StatefulWidget {
  const FinanceView({super.key});

  @override
  State<FinanceView> createState() => _FinanceViewState();
}

class _FinanceViewState extends State<FinanceView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 38, 99),
      ),
      height: 140,
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: SafeArea(
          bottom: false,
          child: Row(
            children: [
              BalanceView(),
              Spacer(),
              BalanceChangeView(),
            ],
          ),
        ),
      ),
    );
  }
}
