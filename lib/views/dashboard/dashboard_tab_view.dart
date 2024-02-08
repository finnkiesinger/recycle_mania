import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'dashboard_tab.dart';
import '../util/smooth_rectangle_border.dart';

class DashboardTabView extends StatefulWidget {
  final List<DashboardTab> tabs;
  final Function(int) onChange;
  final int index;

  const DashboardTabView({
    super.key,
    required this.onChange,
    required this.index,
    required this.tabs,
  });

  @override
  State<DashboardTabView> createState() => _DashboardTabViewState();
}

class _DashboardTabViewState extends State<DashboardTabView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: ShapeDecoration(
            color: Colors.white10,
            shape: SmoothRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              smoothness: 1.0,
            ),
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              AnimatedPositioned(
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 150),
                left: widget.index * 100,
                child: Container(
                  width: 100,
                  height: 36,
                  decoration: ShapeDecoration(
                    color: Colors.white10,
                    shape: SmoothRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      smoothness: 1.0,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  ...widget.tabs.mapIndexed(
                    (index, tab) => GestureDetector(
                      onTap: () {
                        widget.onChange(index);
                      },
                      child: tab,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
