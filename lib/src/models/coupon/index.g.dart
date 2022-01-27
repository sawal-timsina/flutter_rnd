// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coupon _$CouponFromJson(Map<String, dynamic> json) => Coupon(
      id: json['id'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      facilityId: json['facility_id'] as int?,
      isPublic: json['is_public'] as bool,
      title: json['title'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      image: json['image'] as String,
      useTimes: json['use_times'] as int,
      description: json['description'] as String,
      benefits: json['benefits'] as String,
      notes: json['notes'] as String,
      area: json['area'] as String,
      specialFeature: json['special_feature'] as String,
      isSpecial: json['is_special'] as bool?,
      useCount: json['useCount'] as int?,
    );

Map<String, dynamic> _$CouponToJson(Coupon instance) => <String, dynamic>{
      'id': instance.id,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'facility_id': instance.facilityId,
      'is_public': instance.isPublic,
      'title': instance.title,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'image': instance.image,
      'use_times': instance.useTimes,
      'description': instance.description,
      'benefits': instance.benefits,
      'notes': instance.notes,
      'area': instance.area,
      'special_feature': instance.specialFeature,
      'is_special': instance.isSpecial,
      'useCount': instance.useCount,
    };
