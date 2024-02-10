import 'package:flutter/material.dart';

class ModalStackProvider extends InheritedWidget {
  final Function(RMSheet sheet) _showSheetImpl;

  const ModalStackProvider(
    this._showSheetImpl, {
    super.key,
    required super.child,
  });
  @override
  bool updateShouldNotify(ModalStackProvider oldWidget) => true;

  void showSheet(RMSheet sheet) {
    _showSheetImpl(sheet);
  }

  static ModalStackProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ModalStackProvider>();
  }

  static ModalStackProvider of(BuildContext context) {
    ModalStackProvider? result = maybeOf(context);
    assert(result != null, "No Modal Stack Provider found in context!");
    return result!;
  }
}

class ModalStack extends StatefulWidget {
  final Widget child;
  const ModalStack({
    super.key,
    required this.child,
  });

  @override
  State<ModalStack> createState() => _ModalStackState();

  static ModalStackProvider? maybeOf(BuildContext context) {
    return ModalStackProvider.maybeOf(context);
  }

  static ModalStackProvider of(BuildContext context) {
    return ModalStackProvider.of(context);
  }
}

class _ModalStackState extends State<ModalStack> {
  final List<RMSheet> _stack = [];

  void showSheet(RMSheet sheet) {
    setState(() {
      _stack.add(sheet);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalStackProvider(
      showSheet,
      child: Stack(
        children: [
          widget.child,
          ..._stack,
        ],
      ),
    );
  }
}

/// RMSheet
class RMSheet extends StatefulWidget {
  const RMSheet({super.key});

  @override
  State<RMSheet> createState() => _RMSheetState();
}

class _RMSheetState extends State<RMSheet> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Hi there"),
    );
  }
}
