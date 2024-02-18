import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'clip_s_rect.dart';
import 'rm_tab_item.dart';

class StaticTabPageView extends StatefulWidget {
  final double width;
  final List<RMTabItem> children;

  const StaticTabPageView({
    super.key,
    required this.width,
    required this.children,
  });

  @override
  State<StaticTabPageView> createState() => _StaticTabPageViewState();
}

class _StaticTabPageViewState extends State<StaticTabPageView> {
  var _active = 0;
  var _prev = 0;

  @override
  Widget build(BuildContext context) {
    var item = widget.children[_active];
    return GestureDetector(
      onTap: item.onTap,
      child: ClipSRect(
        radius: 16,
        child: Container(
          width: widget.width,
          height: 60,
          color: const Color.fromARGB(255, 50, 50, 50),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                color:
                    item.color ?? widget.children[_prev].color?.withOpacity(0),
              ),
              PageView(
                onPageChanged: (index) {
                  setState(() {
                    _prev = _active;
                    _active = index;
                  });
                },
                children: [
                  ...widget.children.map((e) => e.widget!),
                ],
              ),
              if (widget.children.length > 1)
                IgnorePointer(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...widget.children.mapIndexed(
                            (index, element) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 150),
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    color: _active == index
                                        ? Colors.white54
                                        : Colors.white24,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
