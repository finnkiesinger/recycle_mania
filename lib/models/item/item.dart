import '../util/rm_icon.dart';

class Item {
  final String name;
  final int price;
  final RMIcon icon;
  final String? description;

  const Item({
    required this.name,
    required this.price,
    required this.icon,
    this.description,
  });
}
