import 'dart:async';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../models/util/game_state.dart';

class GameView extends StatefulWidget {
  final GameState state;

  const GameView({
    super.key,
    required this.state,
  });

  @override
  State<GameView> createState() => _GameViewState();
}

const baseUpdateTime = 1000;
const updateInterval = 1000 ~/ 60;

class _GameViewState extends State<GameView> with WidgetsBindingObserver {
  late Timer _timer;
  var _accu = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _timer = Timer.periodic(
      const Duration(milliseconds: updateInterval),
      (timer) async {
        _accu += updateInterval;

        if (_accu > baseUpdateTime ~/ widget.state.timeMultiplier) {
          _accu = 0;

          if (widget.state.speedSetting != SpeedSetting.paused) {
            widget.state.update();
          }
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  SpeedSetting? _prevSetting;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        if (_prevSetting != SpeedSetting.paused) {
          widget.state.changeSpeed(SpeedSetting.normal);
        }
        _prevSetting = null;
        break;
      default:
        _prevSetting ??= widget.state.speedSetting;
        widget.state.changeSpeed(SpeedSetting.paused);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
