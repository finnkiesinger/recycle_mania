import 'package:flutter/material.dart';

import '../../../models/util/io.dart';
import '../processing_view.dart';

class ProcessingGraph extends StatelessWidget {
  final List<IO> input;
  final List<IO> output;

  const ProcessingGraph({
    super.key,
    required this.input,
    required this.output,
  }) : assert(input.length > 0 && output.length > 0);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomPaint(
        painter: ProcessingGraphDrawer(
          input: input,
          output: output,
        ),
      ),
    );
  }
}

const lineColor = Color(0xFF626262);

class ProcessingGraphDrawer extends CustomPainter {
  final List<IO> input;
  final List<IO> output;

  const ProcessingGraphDrawer({
    required this.input,
    required this.output,
  });

  void paintInput(Canvas canvas, Size size) {
    var total = processViewNodeHeight * input.length;
    var min = -total / 2.0 + processViewNodeHeight / 2;

    for (var i = 0; i < input.length; i++) {
      var origin =
          Offset(-10, size.height / 2 + min + i * processViewNodeHeight);
      var destination = Offset(
        size.width / 2 - 40,
        size.height / 2,
      );

      Path path = Path()
        ..moveTo(origin.dx, origin.dy)
        ..cubicTo(
          origin.dx + (destination.dx - origin.dx) / 2,
          origin.dy,
          origin.dx + (destination.dx - origin.dx) / 2,
          destination.dy,
          destination.dx,
          destination.dy,
        );

      canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = lineColor
          ..strokeWidth = 4
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  void paintOutput(Canvas canvas, Size size) {
    var total = processViewNodeHeight * output.length;
    var min = -total / 2.0 + processViewNodeHeight / 2;

    for (var i = 0; i < output.length; i++) {
      var origin = Offset(
        size.width / 2 + 40,
        size.height / 2,
      );
      var destination = Offset(
        size.width + 10,
        size.height / 2 + min + i * processViewNodeHeight,
      );

      Path path = Path()
        ..moveTo(origin.dx, origin.dy)
        ..cubicTo(
          origin.dx + (destination.dx - origin.dx) / 2,
          origin.dy,
          origin.dx + (destination.dx - origin.dx) / 2,
          destination.dy,
          destination.dx,
          destination.dy,
        );

      canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = lineColor
          ..strokeWidth = 4
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintInput(canvas, size);
    paintOutput(canvas, size);
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
