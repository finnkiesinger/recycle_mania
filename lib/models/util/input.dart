import '../item/item.dart';

class Input<T extends Item> {
  final T item;
  final int time;

  const Input({required this.time, required this.item});
}
