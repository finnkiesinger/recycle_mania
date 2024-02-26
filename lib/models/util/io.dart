import '../item/item.dart';

class IO<T extends Item> {
  final T item;
  final int amount;

  const IO({required this.amount, required this.item});
}
