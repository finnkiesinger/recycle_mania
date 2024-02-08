abstract mixin class TimedObject {
  abstract final int time;
  int _accumulator = 0;
  bool _active = false;

  TimedObject();

  void step() {
    if (_active) {
      _accumulator++;
      if (_accumulator == time) {
        _accumulator = 0;
        _active = false;
        end();
      }
    }

    if (canStart && !_active) {
      _active = true;
      start();
    }
  }

  void end();

  void start();

  bool get canStart;
}
