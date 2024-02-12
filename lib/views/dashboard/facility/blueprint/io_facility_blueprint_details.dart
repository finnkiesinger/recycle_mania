import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../models/crafting/io_facility_blueprint.dart';
import '../../../../models/facility/io_facility.dart';
import '../../../util/smooth_rectangle_border.dart';
import '../../../util/tap_scale.dart';
import '../facility_list_item.dart';

extension on EdgeInsets {
  static EdgeInsets horizontal(double padding) {
    return EdgeInsets.symmetric(horizontal: padding);
  }
}

class IOFacilityBlueprintDetails extends StatelessWidget {
  final IOFacilityBlueprint blueprint;
  const IOFacilityBlueprintDetails({
    super.key,
    required this.blueprint,
  });

  IOFacility get facility => blueprint.output as IOFacility;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.zero.copyWith(
            top: 16,
            bottom: 92 + MediaQuery.of(context).viewPadding.bottom,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    facility.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            if (blueprint.description != null) ...[
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Text(
                  "Description:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  blueprint.description!,
                  style: const TextStyle(
                    color: Colors.white60,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                "Pipeline:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 4),
            FacilityListItem(
              facility: facility,
              hideTitle: true,
              animating: false,
              collapsed: true,
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                "Requirements:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ...blueprint.requirements.mapIndexed((i, r) {
              Widget icon;

              if (r.item.icon.icon != null) {
                icon = Icon(
                  r.item.icon.icon,
                  color: Colors.white,
                  size: 24,
                );
              } else {
                icon = r.item.icon.widget!;
              }

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 237, 138, 0),
                      ),
                      child: Center(
                        child: Text(
                          "$i",
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                r.item.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Text("\$${r.item.price}"),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            r.item.description ?? "",
                            style: const TextStyle(
                              color: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            })
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewPadding.bottom + 16),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TapScale(
                  onTap: Navigator.of(context).pop,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: ShapeDecoration(
                      shape: SmoothRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        smoothness: 1.0,
                      ),
                      color: const Color.fromARGB(255, 50, 50, 50),
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: Color(0xFF888888),
                      size: 42,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
