import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../data/powerups.dart';
import '../../../models/item/resource.dart';
import '../../../models/powerup/powerup.dart';
import '../../../models/powerup/timed_powerup.dart';
import '../../../models/util/game_state.dart';
import '../../util/charge_button.dart';
import '../../util/smooth_rectangle_border.dart';

class PowerupsMarket extends StatelessWidget {
  const PowerupsMarket({super.key});

  bool _inInventory(GameState game, Powerup powerup) {
    if (powerup is TimedPowerup) {
      return false;
    }

    return game.powerups.contains(powerup);
  }

  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();
    var powerups = Powerups.all.sortedBy<num>((element) => element.price);

    return ListView.separated(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 100,
      ),
      itemCount: powerups.length,
      itemBuilder: (context, index) {
        var powerup = powerups[index];

        Widget child = Container();

        if (powerup is AutoSellPowerup) {
          child = AutoSellPowerupWidget(powerup: powerup);
        } else if (powerup == Powerups.facilitySelling) {
          child =
              FacilitySellingPowerupWidget(powerup: Powerups.facilitySelling);
        }

        var inInventory = _inInventory(game, powerup);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              child,
              const SizedBox(height: 16),
              Row(
                children: [
                  const Spacer(),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 150),
                      child: inInventory
                          ? ChargeButton(
                              key: const ValueKey<bool>(false),
                              icon: Icons.attach_money_rounded,
                              text: "BOUGHT",
                              color: const Color.fromARGB(255, 0, 163, 95),
                              chargeColor:
                                  const Color.fromARGB(255, 0, 114, 67),
                              disabled: true,
                              onTap: () {},
                              chargeTime: 1.0,
                              hint: "",
                            )
                          : ChargeButton(
                              key: const ValueKey<bool>(true),
                              icon: Icons.attach_money_rounded,
                              text: "BUY",
                              color: const Color.fromARGB(255, 0, 163, 95),
                              chargeColor:
                                  const Color.fromARGB(255, 0, 114, 67),
                              disabled: false,
                              onTap: () {
                                game.addPowerup(powerup);
                                HapticFeedback.lightImpact();
                              },
                              chargeTime: 1.0,
                              hint:
                                  "Price: \$${NumberFormat.decimalPattern(Localizations.localeOf(context).toString()).format(powerup.price)}",
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              height: 2,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AutoSellPowerupWidget extends StatelessWidget {
  final AutoSellPowerup powerup;
  const AutoSellPowerupWidget({
    super.key,
    required this.powerup,
  });

  @override
  Widget build(BuildContext context) {
    var color = Colors.white;

    if (powerup.item is Resource) {
      var item = powerup.item as Resource;
      color = item.color;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: ShapeDecoration(
                shape: SmoothRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  smoothness: 1.0,
                ),
                color: color.withOpacity(0.15),
              ),
              child: Row(
                children: [
                  Text(
                    "${powerup.name}: ",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    powerup.item.name,
                    style: TextStyle(
                      fontSize: 20,
                      color: color,
                      shadows: [
                        Shadow(
                          color: color.withOpacity(0.7),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                powerup.description,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FacilitySellingPowerupWidget extends StatelessWidget {
  final Powerup powerup;
  const FacilitySellingPowerupWidget({
    super.key,
    required this.powerup,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: ShapeDecoration(
            shape: SmoothRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              smoothness: 1.0,
            ),
            color: Colors.white10,
          ),
          child: Text(
            powerup.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                powerup.description,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
