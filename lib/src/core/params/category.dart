import 'package:json_annotation/json_annotation.dart';
import 'package:query_provider/models/params.dart';

part 'category.g.dart';

enum CategoryType { facility, townInfo, coupon }

extension GetCategoryType on CategoryType {
  String get value {
    switch (this) {
      case CategoryType.facility:
        return "facility";
      case CategoryType.townInfo:
        return "town_info";
      case CategoryType.coupon:
        return "coupon";
    }
  }
}

@JsonSerializable()
class CategoryParams implements Params {
  final String type;

  CategoryParams({
    this.type = "",
  });

  @override
  Map<String, dynamic> toJson() => _$CategoryParamsToJson(this);

  @override
  CategoryParams clone() {
    return CategoryParams(type: type);
  }
}
