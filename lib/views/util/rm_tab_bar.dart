import 'package:flutter/material.dart';

import 'rm_tab_item.dart';
import 'smooth_rectangle_border.dart';
import 'static_tab_page_view.dart';

class RMTabBar extends StatelessWidget {
  final int index;
  final List<RMTabItem> children;

  const RMTabBar({
    super.key,
    required this.children,
    required this.index,
  }) : assert(children.length > 0, "RMTabBar must contain at least one child");

  @override
  Widget build(BuildContext context) {
    var dynamic = children.where((tab) => !tab.static);
    var static = children.where((tab) => tab.static);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
      child: LayoutBuilder(builder: (context, constraints) {
        var width = constraints.maxWidth;
        var staticMultiplier = static.isNotEmpty ? 1 : 0;
        var staticWidth = (width - 8 * staticMultiplier) / (dynamic.length + 1);
        var dynamicWidth = (width - 8 * staticMultiplier) *
            dynamic.length /
            (dynamic.length + 1);

        return Row(
          children: [
            Container(
              width: dynamicWidth,
              height: 60,
              decoration: ShapeDecoration(
                shape: SmoothRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  smoothness: 1.0,
                ),
                color: const Color.fromARGB(255, 50, 50, 50),
              ),
              child: LayoutBuilder(builder: (context, constraints) {
                var width = dynamicWidth / dynamic.length;
                return Stack(
                  children: [
                    AnimatedPositioned(
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 250),
                      top: 4,
                      left: 4 + index * width,
                      child: Container(
                        height: constraints.maxHeight - 8,
                        width: width - 8,
                        decoration: ShapeDecoration(
                          shape: SmoothRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                            smoothness: 1,
                          ),
                          color: Colors.white10,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        ...dynamic.map(
                          (tab) {
                            return Expanded(child: tab);
                          },
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
            if (static.isNotEmpty) ...[
              const SizedBox(width: 8),
              StaticTabPageView(
                width: staticWidth,
                children: static.toList(),
              ),
            ],
          ],
        );
      }),
    );
  }
}
