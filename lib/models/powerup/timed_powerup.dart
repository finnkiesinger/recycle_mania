import 'powerup.dart';

abstract class TimedPowerup extends Powerup {
  final int time;
  final Function() end;
  int _accu = 0;

  TimedPowerup({
    required super.name,
    required super.description,
    required super.price,
    required this.time,
    required this.end,
  });

  void step() {
    if (++_accu == time) {
      end();
    }
  }
}
