import 'package:flutter/material.dart';

class DashboardTab extends StatelessWidget {
  final String name;

  const DashboardTab({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 100,
      child: Center(
        child: Text(
          name.toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
