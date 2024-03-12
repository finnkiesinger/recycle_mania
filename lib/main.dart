import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/util/game_manager.dart';
import 'models/util/save_game.dart';
import 'views/recycle_mania_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SaveGame.init();
  runApp(RecycleMania());
}

class RecycleMania extends StatelessWidget {
  RecycleMania({super.key});

  final GameManager manager = GameManager();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameManager>.value(
      value: manager,
      child: const RecycleManiaWrapper(),
    );
  }
}
