import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/util/game_manager.dart';
import 'models/util/game_state.dart';
import 'screens/main_menu_screen.dart';
import 'views/game_view.dart';
import 'views/recycle_mania_wrapper.dart';

void main() {
  runApp(RecycleMania());
}

const defaultTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontFamily: "Nunito",
);

class RecycleMania extends StatelessWidget {
  const RecycleMania({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameManager>.value(
      value: GameManager(),
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
        home: const Scaffold(
          body: RecycleManiaWrapper(),
        ),
      ),
    );
  }
}
