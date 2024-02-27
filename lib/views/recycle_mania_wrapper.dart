import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/util/game_manager.dart';
import '../screens/main_menu_screen.dart';
import 'game_view.dart';

class RecycleManiaWrapper extends StatelessWidget {
  const RecycleManiaWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    var manager = context.watch<GameManager>();
    var game = manager.game;
    if (game != null) {
      return ChangeNotifierProvider.value(
        value: game,
        child: GameView(state: game),
      );
    } else {
      return const MainMenuScreen();
    }
  }
}
