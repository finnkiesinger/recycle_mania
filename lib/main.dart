import 'package:flutter/material.dart';
import 'package:recycle_mania/models/util/game_state.dart';
import 'package:recycle_mania/views/game_view.dart';

void main() {
  runApp(RecycleMania());
}

const defaultTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontFamily: "Nunito",
);

class RecycleMania extends StatelessWidget {
  RecycleMania({super.key});

  final _game = GameState.create();

  @override
  Widget build(BuildContext context) {
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
      home: Scaffold(
        body: GameView(
          state: _game,
        ),
      ),
    );
  }
}
