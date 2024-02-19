import 'package:flutter/material.dart';

import '../dashboard/dashboard_tab.dart';
import '../dashboard/dashboard_tab_view.dart';

class Market extends StatefulWidget {
  const Market({super.key});

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {
  late final PageController _controller;
  late int _page;

  @override
  void initState() {
    super.initState();

    _controller = PageController(
      initialPage: 0,
    );
    _page = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 8,
          ),
          child: DashboardTabView(
            index: _page,
            onChange: (index) {
              setState(() {
                _page = index;
                _controller.animateToPage(
                  _page,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 200),
                );
              });
            },
            tabs: const [
              DashboardTab(
                name: "Blueprints",
              ),
              DashboardTab(
                name: "Powerups",
              ),
            ],
          ),
        ),
        Expanded(
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                _page = index;
              });
            },
            controller: _controller,
            children: [
              Center(
                child: Text("Blueprints"),
              ),
              Center(
                child: Text("Powerups"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
