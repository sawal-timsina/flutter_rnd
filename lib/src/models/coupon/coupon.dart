import 'package:json_annotation/json_annotation.dart';
import 'package:watamuki/src/models/index.dart';

part 'coupon.g.dart';

@JsonSerializable()
class Coupon extends Indexable {
  int id;
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "facility_id")
  int? facilityId;
  @JsonKey(name: "is_public")
  bool isPublic;
  String title;
  @JsonKey(name: "start_date")
  String? startDate;
  @JsonKey(name: "end_date")
  String endDate;
  String image;
  @JsonKey(name: "use_times")
  int useTimes;
  String description;
  String benefits;
  String notes;
  String? area;
  @JsonKey(name: "special_feature")
  String? specialFeature;
  @JsonKey(name: "is_special")
  bool? isSpecial;
  @JsonKey(name: "useCount")
  int? useCount;

  Coupon({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.facilityId,
    required this.isPublic,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.image,
    required this.useTimes,
    required this.description,
    required this.benefits,
    required this.notes,
    required this.area,
    required this.specialFeature,
    this.isSpecial,
    this.useCount,
  }) : super(id);

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CouponToJson(this);
}
