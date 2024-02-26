import '../item/item.dart';

import 'io.dart';

class Output<T extends Item> extends IO<T> {
  const Output({required super.amount, required super.item});
}
