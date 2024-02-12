import 'package:flutter/material.dart';
import 'balance_view.dart';

import 'balance_change_view.dart';

class FinanceView extends StatefulWidget {
  const FinanceView({super.key});

  @override
  State<FinanceView> createState() => _FinanceViewState();
}

class _FinanceViewState extends State<FinanceView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80 + MediaQuery.of(context).viewPadding.top,
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
