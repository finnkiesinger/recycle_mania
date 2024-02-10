import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:recycle_mania/data/resources.dart';
import 'package:recycle_mania/views/util/smooth_rectangle_border.dart';

import '../../util/bottom_dock.dart';
import 'resource_view.dart';

class AlternativeResourcesView extends StatefulWidget {
  const AlternativeResourcesView({super.key});

  @override
  State<AlternativeResourcesView> createState() =>
      _AlternativeResourcesViewState();
}

class _AlternativeResourcesViewState extends State<AlternativeResourcesView>
    with AutomaticKeepAliveClientMixin {
  int _active = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ResourceView(
            resource: resources[_active],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: 16 + MediaQuery.of(context).viewPadding.bottom,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: BottomDock(
              children: [
                ...resources.mapIndexed(
                  (index, resource) {
                    return GestureDetector(
                      onTap: () {
                        if (index != _active) {
                          setState(() {
                            _active = index;
                            HapticFeedback.lightImpact();
                          });
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        width: _active == index ? 60 : 50,
                        height: _active == index ? 60 : 50,
                        decoration: ShapeDecoration(
                          color: index == _active
                              ? resource.color
                              : resource.color.withOpacity(0.5),
                          shape: SmoothRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            smoothness: 0.8,
                          ),
                        ),
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 150),
                          scale: _active == index ? 1.3 : 1,
                          child: Icon(
                            resource.icon.icon,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
