import 'package:flutter/material.dart';

class ModalStackProvider extends InheritedWidget {
  final Function(RMSheet sheet) _showSheetImpl;
  final Function() _popImpl;

  const ModalStackProvider(
    this._showSheetImpl,
    this._popImpl, {
    super.key,
    required super.child,
  });

  @override
  bool updateShouldNotify(ModalStackProvider oldWidget) => true;

  void showSheet(RMSheet sheet) {
    _showSheetImpl(sheet);
  }

  void pop() {
    _popImpl();
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
  final List<_RMSheetWrapper> _stack = [];
  final List<RMSheetController> _controller = [];
  var _empty = true;

  void showSheet(RMSheet sheet) {
    setState(() {
      var controller = RMSheetController();
      _stack.add(
        _RMSheetWrapper(
          controller: controller,
          child: sheet,
        ),
      );
      _empty = false;
      _controller.add(controller);
    });
  }

  void pop() {
    if (_stack.length == 1) {
      setState(() {
        _empty = true;
      });
    }
    _controller[_controller.length - 1].progress(0, then: () {
      setState(() {
        _controller.removeAt(_controller.length - 1);
        _stack.removeAt(_stack.length - 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalStackProvider(
      showSheet,
      pop,
      child: Stack(
        children: [
          widget.child,
          IgnorePointer(
            child: Positioned.fill(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: !_empty ? 0.5 : 0,
                child: Container(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          ..._stack,
        ],
      ),
    );
  }
}

class _RMSheetWrapper extends StatefulWidget {
  final RMSheetController controller;
  final RMSheet child;

  const _RMSheetWrapper({
    required this.controller,
    required this.child,
  });

  @override
  State<_RMSheetWrapper> createState() => _RMSheetWrapperState();
}

class _RMSheetWrapperState extends State<_RMSheetWrapper>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  var _maxHeight = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    widget.controller.setProgress(setProgress);
    setProgress(1.0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _maxHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top -
        16;
  }

  Future<void> setProgress(double progress, {Function()? then}) async {
    assert(progress >= 0.0 && progress <= 1.0);
    await _controller.animateTo(
      progress,
      duration: const Duration(
        milliseconds: 250,
      ),
      curve: Curves.easeInOut,
    );
    then?.call();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Positioned(
          left: 0,
          right: 0,
          bottom: -_maxHeight * (1 - _animation.value),
          height: _maxHeight,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}

class RMSheetController {
  late Future<void> Function(double, {Function()? then}) progress;

  void setProgress(Future<void> Function(double, {Function()? then}) progress) {
    this.progress = progress;
  }
}

/// RMSheet
class RMSheet extends StatefulWidget {
  final Widget child;

  const RMSheet({
    super.key,
    required this.child,
  });

  @override
  State<RMSheet> createState() => _RMSheetState();
}

class _RMSheetState extends State<RMSheet> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
