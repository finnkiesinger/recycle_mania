import 'package:recycle_mania/models/facility/io_facility.dart';

import '../util/input.dart';
import '../util/output.dart';
import '../item/product.dart';
import '../item/resource.dart';

class ProductionFacility extends IOFacility<Resource, Product> {
  @override
  final int time;

  @override
  final int cooldown;

  @override
  final List<Input<Resource>> input;

  @override
  final List<Output<Product>> output;

  ProductionFacility({
    required super.name,
    required super.cost,
    required this.time,
    required this.input,
    required this.output,
    required this.cooldown,
  });

  @override
  void start() {}

  @override
  void end() {}

  @override
  bool get canStart => true;
}
