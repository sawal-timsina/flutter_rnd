import 'package:json_annotation/json_annotation.dart';
import 'package:watamuki/src/core/params/index.dart';

part 'facility.g.dart';

@JsonSerializable()
class FacilityParams implements Params {
  String? area;
  @JsonKey(name: "category_id")
  int? categoryId;

  FacilityParams({
    this.categoryId,
    this.area,
  });

  @override
  Map<String, dynamic> toJson() => _$FacilityParamsToJson(this);
}
