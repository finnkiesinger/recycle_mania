import 'package:flutter/material.dart';

import 'game_state.dart';

class GameManager with ChangeNotifier {
  GameState? game;

  void setGame(GameState game) {
    this.game = game;
    GameState.active = game;
    notifyListeners();
  }

  void closeGame() {
    game = null;
    notifyListeners();
  }
}
