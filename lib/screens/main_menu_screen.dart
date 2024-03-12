import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../models/util/game_manager.dart';
import '../models/util/game_state.dart';
import '../views/util/color_button.dart';
import '../views/util/particle_system_widget.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var manager = context.watch<GameManager>();

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
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 3,
            sigmaY: 3,
          ),
          child: Opacity(
            opacity: 0.7,
            child: Container(
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
          ),
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
                        onTap: () async {
                          HapticFeedback.lightImpact();
                          manager.setGame(GameState.create());
                        },
                        color: const Color(0xFF002877),
                        textColor: Color.lerp(
                          const Color(0xFF87FF5E),
                          const Color(0xFF42FFBB),
                          0.85,
                        )!,
                        text: "Start Game",
                      ),
                    ),
                  ],
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
