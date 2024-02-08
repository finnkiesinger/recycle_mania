import 'package:flutter/material.dart';
import 'package:recycle_mania/data/resources.dart';
import 'package:recycle_mania/data/wastes.dart';
import 'package:recycle_mania/models/facility/processing_facility.dart';
import 'package:recycle_mania/models/facility/storage_facility.dart';
import 'package:recycle_mania/models/util/game_state.dart';
import 'package:recycle_mania/models/util/output.dart';
import 'package:recycle_mania/views/game_view.dart';
import 'data/facilities.dart';
import 'models/util/input.dart';
import 'screens/home_screen.dart';

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

  final _game = GameState(
    facilities: [
      StorageFacility(
        name: "Metal Storage",
        capacity: 100,
        cost: 100,
        item: metal,
      ),
      oldComputersProcessingFacility,
    ],
    storage: {},
    money: 50000000000,
  );

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
      home: GameView(
        state: _game,
      ),
    );
  }
}
