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

class CategoryParams {
  final String type;

  CategoryParams({
    this.type = "",
  });
}
