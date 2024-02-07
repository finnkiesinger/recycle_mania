import 'package:flutter/material.dart';
import 'package:recycle_mania/views/alternative_resources_view.dart';
import 'package:recycle_mania/views/resources_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        AlternativeResourcesView(),
      ],
    );
  }
}
