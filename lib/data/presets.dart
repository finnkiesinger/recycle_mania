import '../models/util/preset.dart';
import 'blueprints.dart';
import 'facilities.dart';

class Presets {
  static final Preset normal = Preset(
    name: "Normal",
    blueprints: [],
    facilities: [],
    money: 50000,
    powerups: [],
    storage: {},
  );

  static final Preset rich = Preset(
    name: "Rich",
    blueprints: [],
    facilities: [],
    storage: {},
    money: 5000000,
    powerups: [],
  );

  static final Preset basic = Preset(
    name: "Basic",
    blueprints: [
      ...Blueprints.all,
    ],
    facilities: [
      Facilities.oldComputersProcessingFacility.create(),
      Facilities.metalStorageFacility.create(),
      Facilities.plasticStorageFacility.create(),
      Facilities.computersProductionFacility.create(),
    ],
    storage: {},
    money: 5000000,
    powerups: [],
  );

  static final List<Preset> presets = [normal];

  static final List<Preset> development = [normal, rich, basic];
}
