// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_business_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBusinessModel _$CreateBusinessModelFromJson(Map<String, dynamic> json) =>
    CreateBusinessModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : CreateBusinessData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$CreateBusinessModelToJson(
        CreateBusinessModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

CreateBusinessData _$CreateBusinessDataFromJson(Map<String, dynamic> json) =>
    CreateBusinessData(
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : AtedAt.fromJson(json['created_at'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] == null
          ? null
          : AtedAt.fromJson(json['updated_at'] as Map<String, dynamic>),
      businessId: json['business_id'] as int?,
      userId: json['user_id'] as int?,
      businessName: json['business_name'] as String?,
      businessType: json['business_type'] as String?,
      pan: json['pan'] as String?,
      gstIn: json['gst_in'] as String?,
    );

Map<String, dynamic> _$CreateBusinessDataToJson(CreateBusinessData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'business_id': instance.businessId,
      'user_id': instance.userId,
      'business_name': instance.businessName,
      'business_type': instance.businessType,
      'pan': instance.pan,
      'gst_in': instance.gstIn,
    };

AtedAt _$AtedAtFromJson(Map<String, dynamic> json) => AtedAt(
      val: json['val'] as String?,
    );

Map<String, dynamic> _$AtedAtToJson(AtedAt instance) => <String, dynamic>{
      'val': instance.val,
    };
