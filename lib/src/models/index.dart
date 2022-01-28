import 'package:watamuki/src/core/QueryProviders/models/params.dart';

abstract class Indexable extends Params {
  late final int key;

  Indexable(this.key);

  operator [](index) => toJson()[index];

  @override
  bool operator ==(Object other) {
    return other is Indexable && other.key == key;
  }

  @override
  int get hashCode => key.hashCode;
}
