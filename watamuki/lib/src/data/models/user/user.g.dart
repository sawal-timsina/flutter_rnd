// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserModalFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      isPhoneVerified: json['is_phone_verified'] as bool,
      firebaseUid: json['firebase_uid'] as String,
      nickName: json['nick_name'] as String,
      email: json['email'] as String,
      fullName: json['full_name'] as String,
      residentStatus: json['resident_status'] as String,
      gender: json['gender'] as String,
      phone: json['phone'] as String,
      age: json['age'] as String,
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$UserModalToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'is_phone_verified': instance.isPhoneVerified,
      'firebase_uid': instance.firebaseUid,
      'nick_name': instance.nickName,
      'email': instance.email,
      'full_name': instance.fullName,
      'resident_status': instance.residentStatus,
      'gender': instance.gender,
      'phone': instance.phone,
      'age': instance.age,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
    };
