import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'game_state.dart';

class SaveGame {
  static late SharedPreferences instance;
  final GameState state;

  SaveGame({
    required this.state,
  });

  static Future<void> init() async {
    instance = await SharedPreferences.getInstance();
  }

  static bool exists() {
    return instance.getString("save_game") != null;
  }

  static GameState load() {
    var raw = instance.getString("save_game");
    assert(raw != null, "Save Game not found");
    var json = jsonDecode(raw!);
    return GameStorage.fromJSON(json);
  }

  static void store(GameState state) {
    var json = GameStorage.toJSON(state);
    var raw = jsonEncode(json);

    instance.setString("save_game", raw);
  }
}
