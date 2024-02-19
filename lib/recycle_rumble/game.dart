import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class RecycleRumbleApp extends StatefulWidget {
  const RecycleRumbleApp({super.key});

  @override
  State<RecycleRumbleApp> createState() => _RecycleRumbleAppState();
}

class _RecycleRumbleAppState extends State<RecycleRumbleApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameWidget(
        game: RecycleRumble(),
      ),
    );
  }
}

class RecycleRumble extends FlameGame {}
