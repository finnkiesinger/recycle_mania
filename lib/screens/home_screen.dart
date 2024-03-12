import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../models/util/game_state.dart';
import '../views/dashboard/dashboard.dart';
import '../views/finance/balance_change_view.dart';
import '../views/finance/balance_view.dart';
import '../views/market/market.dart';
import '../views/settings_modal.dart';
import '../views/util/rm_tab_bar.dart';
import '../views/util/rm_tab_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameState>();
    var roc = game.activeCost;

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Expanded(
            child: PageTransitionSwitcher(
              reverse: _index == 1,
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (child, primary, secondary) {
                return SlideTransition(
                  position: Tween<Offset>(
                    end: Offset.zero,
                    begin: const Offset(-1.0, 0),
                  ).chain(CurveTween(curve: Curves.easeInOut)).animate(primary),
                  child: SlideTransition(
                    position: Tween<Offset>(
                      end: const Offset(1.0, 0),
                      begin: Offset.zero,
                    )
                        .chain(CurveTween(curve: Curves.easeInOut))
                        .animate(secondary),
                    child: child,
                  ),
                );
              },
              child: IndexedStack(
                key: ValueKey<int>(_index),
                index: _index,
                children: const [
                  Dashboard(),
                  Market(),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: RMTabBar(
              index: _index,
              children: [
                RMTabItem(
                  icon: Icons.factory_rounded,
                  active: _index == 0,
                  onTap: () {
                    if (_index != 0) {
                      HapticFeedback.lightImpact();
                    }
                    setState(() {
                      _index = 0;
                    });
                  },
                ),
                RMTabItem(
                  icon: Icons.shopping_cart_rounded,
                  active: _index == 1,
                  onTap: () {
                    if (_index != 1) {
                      HapticFeedback.lightImpact();
                    }
                    setState(() {
                      _index = 1;
                    });
                  },
                ),
                const RMTabItem(
                  widget: BalanceView(),
                  color: Color.fromARGB(255, 0, 100, 181),
                ),
                RMTabItem(
                  widget: const BalanceChangeView(),
                  color: roc >= 0
                      ? const Color.fromARGB(255, 0, 163, 95)
                      : const Color.fromARGB(255, 231, 48, 35),
                ),
                if (kDebugMode)
                  RMTabItem(
                    onTap: () {
                      showCupertinoModalBottomSheet(
                        context: context,
                        isDismissible: false,
                        enableDrag: false,
                        duration: const Duration(milliseconds: 250),
                        builder: (context) => const Scaffold(
                          body: SettingsModal(),
                        ),
                      );
                      HapticFeedback.lightImpact();
                    },
                    widget: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 4.0),
                        child: Icon(
                          Icons.settings_rounded,
                          color: Colors.white,
                          size: 36,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
