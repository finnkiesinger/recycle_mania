import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../data/resources.dart';
import '../../util/dock_element.dart';
import '../../util/smooth_rectangle_border.dart';

import '../../util/bottom_dock.dart';
import '../facility/storage_blueprint/storage_blueprint_list.dart';
import 'resource_view.dart';
import 'storage_list.dart';

class AlternativeResourcesView extends StatefulWidget {
  final bool active;

  const AlternativeResourcesView({
    super.key,
    required this.active,
  });

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
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ResourceView(
                resource: resources[_active],
              ),
            ),
            const Text(
              "Storage Facilities",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                height: 1,
              ),
            ),
            Expanded(
              child: StorageList(resource: resources[_active]),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 80,
                        child: CustomPaint(
                          painter: ButtonOutlinePainter(),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: Center(
                          child: DockElement(
                            onTap: () {
                              HapticFeedback.lightImpact();
                              showCupertinoModalBottomSheet(
                                context: context,
                                isDismissible: false,
                                enableDrag: false,
                                barrierColor: Colors.black38,
                                duration: const Duration(milliseconds: 250),
                                builder: (context) {
                                  return const Scaffold(
                                    body: StorageBlueprintList(),
                                  );
                                },
                              );
                            },
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 0, 163, 95),
                                Color.fromARGB(255, 0, 114, 67),
                              ],
                            ),
                            icon: Icons.build_rounded,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                BottomDock(
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ButtonOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerWidth = size.width / 2;

    Path path =
        SmoothRectangleBorder(borderRadius: BorderRadius.circular(30)).getPath(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
            center: Offset(
              centerWidth,
              size.height / 2,
            ),
            width: 80,
            height: 80),
        const Radius.circular(30),
      ),
    );

    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.fill
        ..color = const Color.fromARGB(255, 50, 50, 50),
    );

    path = Path()
      ..moveTo(centerWidth - 120, size.height)
      ..cubicTo(centerWidth - 60, size.height, centerWidth - 40,
          size.height - 10, centerWidth - 40, 30)
      ..lineTo(centerWidth, size.height);

    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.fill
        ..color = const Color.fromARGB(255, 50, 50, 50),
    );

    path = Path()
      ..moveTo(centerWidth + 120, size.height)
      ..cubicTo(centerWidth + 60, size.height, centerWidth + 40,
          size.height - 10, centerWidth + 40, 30)
      ..lineTo(centerWidth, size.height);

    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.fill
        ..color = const Color.fromARGB(255, 50, 50, 50),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
