import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:recycle_mania/data/resources.dart';
import 'package:recycle_mania/views/util/linear_progress_view.dart';
import 'package:recycle_mania/views/dashboard/resource_name_view.dart';

class AlternativeResourcesView extends StatefulWidget {
  const AlternativeResourcesView({super.key});

  @override
  State<AlternativeResourcesView> createState() =>
      _AlternativeResourcesViewState();
}

class _AlternativeResourcesViewState extends State<AlternativeResourcesView> {
  int _active = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResourceNameView(
                    resource: resources[_active],
                  ),
                  const SizedBox(height: 24),
                  const LinearProgressView(
                    leading: Icon(
                      Icons.warehouse_rounded,
                      color: Colors.white,
                    ),
                    color: Colors.cyan,
                    progress: 0.2,
                  ),
                  const SizedBox(height: 20),
                  const LinearProgressView(
                    leading: Icon(
                      Icons.trending_up_rounded,
                      color: Colors.black87,
                    ),
                    color: Colors.amber,
                    progress: 1.0,
                  ),
                  const SizedBox(height: 12),
                  const LinearProgressView(
                    leading: Icon(
                      Icons.trending_down_rounded,
                      color: Colors.white,
                    ),
                    color: Colors.deepOrange,
                    progress: 0.5,
                  ),
                ],
              ),
              const SizedBox(height: 48),
            ],
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
