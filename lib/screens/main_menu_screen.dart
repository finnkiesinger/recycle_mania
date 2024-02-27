import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../views/util/color_button.dart';
import '../views/util/outline_button.dart';
import '../views/util/particle_system_widget.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF87FF5E),
                Color(0xFF42FFBB),
              ],
            ),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            return ParticleSystemWidget(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
            );
          },
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 48),
              Center(
                child: SvgPicture.asset(
                  "assets/logo.svg",
                  width: MediaQuery.of(context).size.width - 64,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ColorButton(
                        onTap: () {
                          HapticFeedback.lightImpact();
                        },
                        color: const Color(0xFF002877),
                        textColor: const Color(0xFF42FFBB),
                        text: "New Game",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlineButton(
                        onTap: () {
                          HapticFeedback.lightImpact();
                        },
                        color: const Color(0xFF002877),
                        text: "Load Game",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 72),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: ColorButton(
                  text: "RECYCLE RUMBLE",
                  onTap: () {},
                  textColor: const Color(0xFF42FFBB),
                  color: const Color(0xFF002877),
                ),
              ),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ],
    );
  }
}
