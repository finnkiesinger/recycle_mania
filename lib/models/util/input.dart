import '../item/item.dart';

import 'io.dart';

class Input<T extends Item> extends IO<T> {
  const Input({required super.amount, required super.item});
}
