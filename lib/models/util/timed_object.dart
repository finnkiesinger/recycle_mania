abstract mixin class TimedObject {
  abstract final int time;
  abstract final int cooldown;

  int _accumulator = 0;
  bool _active = false;
  bool _coolingDown = false;
  bool _paused = false;

  TimedObject();

  void step() {
    if (_paused) return;

    if (_active || _coolingDown) {
      _accumulator++;
      if (_active) {
        if (_accumulator == time) {
          _accumulator = 0;
          _active = false;
          _coolingDown = true;
          end();
        }
      } else {
        if (_accumulator == cooldown) {
          _accumulator = 0;
          _coolingDown = false;
        }
      }
    }

    if (canStart && !_active && !_coolingDown) {
      _active = true;
      start();
    }
  }

  void end();

  void start();

  void togglePause() {
    _paused = !_paused;
  }

  bool get canStart;

  bool get coolingDown => _coolingDown;

  bool get active => _active;

  bool get paused => _paused;

  double get progress {
    if (_active) {
      return _accumulator.toDouble() / time;
    }
    if (_coolingDown) {
      return _accumulator.toDouble() / cooldown;
    }

    return 0.0;
  }

  double get currentTime {
    if (_active) {
      return time.toDouble();
    }
    if (_coolingDown) {
      return cooldown.toDouble();
    }

    return 0.0;
  }

  void setAccu(int accu) {
    _accumulator = accu;
  }

  void setPaused(bool paused) {
    _paused = paused;
  }

  void setActive(bool active) {
    _active = active;
  }

  void setCoolingDown(bool coolingDown) {
    _coolingDown = coolingDown;
  }
}
