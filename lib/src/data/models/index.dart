import 'package:watamuki/src/core/params/index.dart';

abstract class Indexable extends Params {
  operator [](index) => toJson()[index];
}
