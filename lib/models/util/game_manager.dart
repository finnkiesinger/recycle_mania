import 'package:flutter/material.dart';

import 'game_state.dart';

class GameManager with ChangeNotifier {
  GameState? game;

  void setGame(GameState game) {
    this.game = game;
  }

  void closeGame() {
    game = null;
  }
}
