import 'package:watamuki/src/core/QueryProviders/models/params.dart';

abstract class Indexable extends Params {
  operator [](index) => toJson()[index];
}
