import '../util/input.dart';
import 'craftable.dart';

abstract class Blueprint {
  final List<Input> requirements;
  final Craftable output;

  const Blueprint({
    required this.output,
    required this.requirements,
  });
}
