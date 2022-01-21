import 'package:json_annotation/json_annotation.dart';

part 'facility.g.dart';

@JsonSerializable()
class Facility {
  final int id;
  final String name;
  final String image;
  final String overview;
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @JsonKey(name: "created_at")
  final String createdAt;

  const Facility({
    required this.id,
    required this.name,
    required this.image,
    required this.overview,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Facility.fromJson(Map<String, dynamic> json) =>
      _$FacilityFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityToJson(this);
}