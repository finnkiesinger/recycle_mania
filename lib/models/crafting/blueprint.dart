import '../util/input.dart';
import 'craftable.dart';

abstract class Blueprint {
  final List<Input> requirements;
  final Craftable output;
  final String? description;

  const Blueprint({
    required this.output,
    required this.requirements,
    this.description,
  });

  int get cost => requirements.isEmpty
      ? 0
      : requirements
          .map((r) => r.item.price * r.amount)
          .reduce((value, element) => value + element);

  Blueprint create();
}
