import 'package:json_annotation/json_annotation.dart';

import '../index.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends Indexable {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
