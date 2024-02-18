import 'package:flutter/material.dart';
import 'dashboard_tab.dart';

import 'resource/alternative_resources_view.dart';
import 'dashboard_tab_view.dart';
import 'facility/processing_view.dart';
import 'facility/production_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late final PageController _controller;
  late int _page;

  @override
  void initState() {
    super.initState();

    _controller = PageController(
      initialPage: 1,
    );
    _page = 1;
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
                name: "Processing",
              ),
              DashboardTab(
                name: "Resources",
              ),
              DashboardTab(
                name: "Production",
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
              const ProcessingView(),
              AlternativeResourcesView(active: _page == 1),
              const ProductionView(),
            ],
          ),
        ),
      ],
    );
  }
}
