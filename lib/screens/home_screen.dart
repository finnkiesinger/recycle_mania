import 'package:flutter/material.dart';
import 'package:recycle_mania/views/dashboard/dashboard.dart';
import 'package:recycle_mania/views/util/modal_stack.dart';
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
      child: Scaffold(
        body: Column(
          children: [
            FinanceView(),
            Expanded(
              child: Dashboard(),
            ),
          ],
        ),
      ),
    );
  }
}
