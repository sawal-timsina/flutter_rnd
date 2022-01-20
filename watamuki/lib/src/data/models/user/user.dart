import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  @JsonKey(name: "is_phone_verified")
  final bool isPhoneVerified;
  @JsonKey(name: "firebase_uid")
  final String firebaseUid;
  @JsonKey(name: "nick_name")
  final String nickName;
  final String email;
  @JsonKey(name: "full_name")
  final String fullName;
  @JsonKey(name: "resident_status")
  final String residentStatus;
  final String gender;
  final String phone;
  final String age;
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @JsonKey(name: "created_at")
  final String createdAt;

  const User({
    required this.id,
    required this.firebaseUid,
    required this.nickName,
    required this.email,
    required this.fullName,
    required this.residentStatus,
    required this.gender,
    required this.phone,
    required this.age,
    required this.isPhoneVerified,
    required this.updatedAt,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserModalFromJson(json);

  Map<String, dynamic> toJson() => _$UserModalToJson(this);
}
