import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

const icons = [
  Icons.recycling_rounded,
  Icons.park_rounded,
  Icons.pedal_bike_rounded,
  Icons.delete_rounded,
  Icons.eco_rounded,
  Icons.electric_scooter_rounded,
  Icons.computer_rounded,
  Icons.note_rounded,
  Icons.wine_bar_rounded,
  Icons.biotech_outlined,
  Icons.tram_rounded,
  Icons.electric_car_rounded,
  Icons.compost_rounded,
  Icons.wind_power_rounded,
  Icons.water_drop_rounded,
  Icons.cruelty_free_rounded,
  Icons.solar_power_rounded,
  Icons.recommend_rounded,
  Icons.energy_savings_leaf_rounded,
];

class Particle {
  final double x;
  final IconData icon;
  double y;
  double speed;
  final Color color;

  Particle({
    required this.x,
    required this.y,
    required this.speed,
    required this.icon,
    required this.color,
  });

  void update(int elapsed) {
    y += speed * elapsed / 1000;
  }
}

class ParticleSystemWidget extends StatefulWidget {
  final int amount;
  final double variance;
  final double width;
  final double height;
  final double baseTime;
  final Color particleColor;

  const ParticleSystemWidget({
    super.key,
    required this.width,
    required this.height,
    this.amount = 1,
    this.variance = 0.5,
    this.baseTime = 5,
    this.particleColor = const Color(0xFF002877),
  });

  @override
  State<ParticleSystemWidget> createState() => _ParticleSystemWidgetState();
}

class _ParticleSystemWidgetState extends State<ParticleSystemWidget>
    with TickerProviderStateMixin {
  static final random = Random();
  late Ticker _ticker;

  double get baseSpeed => 0.5 * widget.height / widget.baseTime;

  final List<Particle> _particles = [];
  var _spawnAccu = 0;
  var _nextParticleTime = 0;

  var _prevMilliseconds = 0;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      var elapsedMilli = elapsed.inMilliseconds - _prevMilliseconds;
      _prevMilliseconds = elapsed.inMilliseconds;
      _spawnAccu += elapsedMilli;

      if (_spawnAccu > _nextParticleTime) {
        var index = (random.nextDouble() * icons.length).floor();

        var color = Color.lerp(
          const Color.fromARGB(255, 24, 109, 0),
          const Color(0xFF002877),
          random.nextDouble(),
        );

        _particles.add(Particle(
          icon: icons[index],
          x: random.nextDouble() * (widget.width - 42),
          y: 0.0,
          speed: baseSpeed * (0.25 + 0.25 * random.nextDouble()),
          color: color!,
        ));

        _nextParticleTime = 500 + (1000 * random.nextDouble()).floor();
        _spawnAccu = 0;
      }

      List<Particle> particlesToRemove = [];

      for (var element in _particles) {
        element.update(elapsedMilli);
        if (element.y > widget.height) {
          particlesToRemove.add(element);
        }
      }

      for (var element in particlesToRemove) {
        _particles.remove(element);
      }

      setState(() {});
    });

    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ..._particles.map(
          (e) => Positioned(
            top: e.y,
            left: e.x,
            child: Opacity(
              opacity: 0.8 * min(e.y, 200) / 200,
              child: Icon(
                e.icon,
                color: e.color,
                size: 42,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
