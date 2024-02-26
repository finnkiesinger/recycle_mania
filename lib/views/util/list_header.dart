import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String text;
  final bool top;
  const Header({
    super.key,
    required this.text,
    this.top = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (top) const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
