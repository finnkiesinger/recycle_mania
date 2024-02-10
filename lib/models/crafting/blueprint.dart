import '../util/input.dart';
import 'craftable.dart';

abstract class Blueprint {
  final List<Input> requirement;
  final Craftable output;

  const Blueprint({
    required this.output,
    required this.requirement,
  });
}
