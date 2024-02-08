import '../facility/io_facility.dart';

class GameState {
  final List<IOFacility> facilities;
  int money;

  GameState({
    required this.facilities,
    required this.money,
  });

  void update() {}
}
