import 'package:flutter/material.dart';

class ProductionView extends StatefulWidget {
  const ProductionView({super.key});

  @override
  State<ProductionView> createState() => _ProductionViewState();
}

class _ProductionViewState extends State<ProductionView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text("Production View"),
      ],
    );
  }
}
