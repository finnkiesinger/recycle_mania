import 'storable.dart';

abstract class StorageManager<T extends Storable> {
  Map<String, dynamic> toJSON(T storable);
  T fromJSON(Map<String, dynamic> json);
}
