import 'package:flutter/material.dart';
import 'package:recycle_mania/views/dashboard.dart';
import '../views/finance_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
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
