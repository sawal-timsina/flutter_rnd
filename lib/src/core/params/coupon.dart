import 'package:json_annotation/json_annotation.dart';
import 'package:query_provider/models/params.dart';

part 'coupon.g.dart';

@JsonSerializable()
class CouponParams implements Params {
  String? area;
  @JsonKey(name: "category_id")
  int? categoryId;
  String? cursor;

  CouponParams({
    this.categoryId,
    this.area,
    this.cursor,
  });

  @override
  Map<String, dynamic> toJson() => _$CouponParamsToJson(this);

  @override
  CouponParams clone() {
    return CouponParams(area: area, categoryId: categoryId, cursor: cursor);
  }
}
