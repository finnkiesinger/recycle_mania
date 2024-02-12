import 'package:flutter/material.dart';
import '../views/dashboard/dashboard.dart';
import '../views/util/modal_stack.dart';
import '../views/finance/finance_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const ModalStack(
      child: Column(
        children: [
          FinanceView(),
          Expanded(
            child: Dashboard(),
          ),
        ],
      ),
    );
  }
}
