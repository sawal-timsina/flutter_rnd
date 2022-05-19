import '../index.dart';

part 'category.g.dart';

class Category extends Indexable {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  }) : super(id);

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int,
        name: json['name'] as String,
      );

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
      };
}
