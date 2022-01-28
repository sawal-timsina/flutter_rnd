import 'package:json_annotation/json_annotation.dart';
import 'package:watamuki/src/core/QueryProviders/models/params.dart';

part 'coupon.g.dart';

@JsonSerializable()
class CouponParams implements Params {
  String? area;
  @JsonKey(name: "category_id")
  int? categoryId;
  @JsonKey(name: "cursor")
  String? cursor;

  CouponParams({
    this.categoryId,
    this.area,
    this.cursor,
  });

  @override
  Map<String, dynamic> toJson() => _$CouponParamsToJson(this);
}
