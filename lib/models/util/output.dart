import '../item/item.dart';

class Output<T extends Item> {
  final T item;
  final int time;

  const Output({required this.time, required this.item});
}
