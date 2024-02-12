import '../item/item.dart';
import '../util/timed_object.dart';

import '../util/input.dart';
import '../util/output.dart';
import 'facility.dart';

abstract class IOFacility<I extends Item, O extends Item> extends Facility
    with TimedObject {
  abstract final List<Input<I>> input;
  abstract final List<Output<O>> output;

  IOFacility({
    required super.name,
    required super.cost,
  });

  IOFacility create();
}
