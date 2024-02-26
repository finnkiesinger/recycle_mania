import 'package:flutter/material.dart';

class EmptyListPlaceholder extends StatelessWidget {
  const EmptyListPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Text("Empty List"),
    );
  }
}

class EmptyBlueprintListPlaceholder extends StatelessWidget {
  const EmptyBlueprintListPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.build_rounded,
                color: Color.fromARGB(255, 100, 100, 100),
                size: 48,
              ),
              Icon(
                Icons.block_rounded,
                color: Color.fromARGB(255, 70, 70, 70),
                size: 108,
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            "You don't have any blueprints yet!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white60,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyFacilityListPlaceholder extends StatelessWidget {
  const EmptyFacilityListPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Spacer(),
          Text(
            "Build your first facility",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white60,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Icon(
            Icons.arrow_downward_rounded,
            size: 48,
            color: Colors.white30,
          ),
          SizedBox(height: 128),
        ],
      ),
    );
  }
}

class EmptyStorageFacilityListPlaceholder extends StatelessWidget {
  const EmptyStorageFacilityListPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Spacer(),
          Text(
            "Build your first facility",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white60,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Icon(
            Icons.arrow_downward_rounded,
            size: 48,
            color: Colors.white30,
          ),
          SizedBox(height: 192),
        ],
      ),
    );
  }
}
