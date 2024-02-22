import '../models/item/item.dart';
import '../models/powerup/powerup.dart';
import 'resources.dart';

class AutoSellPowerup extends Powerup {
  final Item item;

  AutoSellPowerup({required this.item})
      : super(
          name: "Auto-Sell",
          description:
              "Instead of disposing of excess ${item.name} if the storage is full, it is sold on the market.",
          price: 1000 * item.price,
        );
}

class Powerups {
  static final autoSellMetal = AutoSellPowerup(item: Resources.metal);
  static final autoSellGlass = AutoSellPowerup(item: Resources.glass);
  static final autoSellPaper = AutoSellPowerup(item: Resources.paper);
  static final autoSellPlastic = AutoSellPowerup(item: Resources.plastic);
  static final autoSellOrganic = AutoSellPowerup(item: Resources.organic);
  static const facilitySelling = Powerup(
    name: "Facility Selling",
    description:
        "When you remove one of your facilities, you get 50% of the construction cost back.",
    price: 100000,
  );

  static final List<Powerup> all = [
    autoSellOrganic,
    autoSellPaper,
    autoSellGlass,
    autoSellMetal,
    autoSellPlastic,
    facilitySelling,
  ];
}
