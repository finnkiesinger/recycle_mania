import 'package:flutter/material.dart';
import '../views/dashboard/dashboard.dart';
import '../views/finance/finance_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _index,
              children: const [
                Dashboard(),
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 35, 35, 35),
            child: SafeArea(
              top: false,
              child: SizedBox(
                height: 50,
                child: Center(
                  child: Text("Bottom Bar"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
