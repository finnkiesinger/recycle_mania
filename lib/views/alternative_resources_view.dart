import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:recycle_mania/data/resources.dart';
import 'package:recycle_mania/views/linear_progress_view.dart';

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
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                width: 120,
                decoration: BoxDecoration(
                  color: resources[_active].color,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: Text(
                    resources[_active].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 1,
                    ),
                  ),
                ),
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
          const SizedBox(height: 24),
          SizedBox(
            height: 70,
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
                          duration: const Duration(milliseconds: 200),
                          width: _active == index ? 70 : 60,
                          height: _active == index ? 70 : 60,
                          decoration: BoxDecoration(
                            color: resource.color,
                            shape: BoxShape.circle,
                          ),
                          child: AnimatedScale(
                            duration: const Duration(milliseconds: 200),
                            scale: _active == index ? 1.3 : 1,
                            child: Icon(
                              resource.icon,
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
    );
  }
}
