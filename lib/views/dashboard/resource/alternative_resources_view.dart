import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:recycle_mania/data/resources.dart';

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

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          ResourceView(
            resource: resources[_active],
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 16 + MediaQuery.of(context).viewPadding.bottom,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...resources.mapIndexed(
                          (index, resource) => Row(
                            children: [
                              GestureDetector(
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
                                  decoration: BoxDecoration(
                                    color: index == _active
                                        ? resource.color
                                        : resource.color.withOpacity(0.5),
                                    shape: BoxShape.circle,
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
                              ),
                              if (index < resources.length - 1)
                                const SizedBox(width: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
