import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/util/game_manager.dart';
import '../models/util/game_state.dart';
import '../screens/main_menu_screen.dart';
import 'game_view.dart';

const defaultTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontFamily: "Nunito",
);

class RecycleManiaWrapper extends StatelessWidget {
  const RecycleManiaWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    var manager = context.watch<GameManager>();
    var game = manager.game;

    if (game != null) {
      return ChangeNotifierProvider<GameState>.value(
        value: game,
        child: MaterialApp(
          title: 'Recycle Mania',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 25, 25, 25),
            textTheme: Theme.of(context).textTheme.copyWith(
                  bodyLarge: defaultTextStyle,
                  bodySmall: defaultTextStyle,
                  bodyMedium: defaultTextStyle,
                ),
          ),
          home: Scaffold(
            body: GameView(state: game),
          ),
        ),
      );
    } else {
      return MaterialApp(
        title: 'Recycle Mania',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 25, 25, 25),
          textTheme: Theme.of(context).textTheme.copyWith(
                bodyLarge: defaultTextStyle,
                bodySmall: defaultTextStyle,
                bodyMedium: defaultTextStyle,
              ),
        ),
        home: const Scaffold(
          body: MainMenuScreen(),
        ),
      );
    }
  }
}
