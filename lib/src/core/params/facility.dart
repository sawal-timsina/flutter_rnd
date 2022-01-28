import 'package:json_annotation/json_annotation.dart';
import 'package:watamuki/src/core/QueryProviders/models/params.dart';

part 'facility.g.dart';

@JsonSerializable()
class FacilityParams implements Params {
  String? area;
  @JsonKey(name: "category_id")
  int? categoryId;
  @JsonKey(name: "cursor")
  String? cursor;

  FacilityParams({
    this.categoryId,
    this.area,
    this.cursor,
  });

  @override
  Map<String, dynamic> toJson() => _$FacilityParamsToJson(this);
}
