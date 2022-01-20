abstract class Indexable {
  Map<String, dynamic> toJson();

  operator [](index) => toJson()[index];
}
