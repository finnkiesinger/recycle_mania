import 'io_facility.dart';
import '../util/output.dart';
import '../item/resource.dart';
import '../util/input.dart';
import '../item/waste.dart';

class ProcessingFacility extends IOFacility<Waste, Resource> {
  @override
  final int time;

  @override
  final int cooldown;

  @override
  final List<Input<Waste>> input;

  @override
  final List<Output<Resource>> output;

  ProcessingFacility({
    required super.name,
    required super.cost,
    required this.input,
    required this.output,
    required this.time,
    required this.cooldown,
  });

  @override
  void start() {}

  @override
  void end() {}

  @override
  bool get canStart => true;
}
