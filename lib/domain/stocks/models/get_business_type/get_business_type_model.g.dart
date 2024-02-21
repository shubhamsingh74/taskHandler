// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_business_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBusinessTypeModel _$GetBusinessTypeModelFromJson(
        Map<String, dynamic> json) =>
    GetBusinessTypeModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BusinessTypeData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$GetBusinessTypeModelToJson(
        GetBusinessTypeModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

BusinessTypeData _$BusinessTypeDataFromJson(Map<String, dynamic> json) =>
    BusinessTypeData(
      businessType: json['business_type'] as String?,
      isCinRequired: json['is_cin_required'] as bool?,
    );

Map<String, dynamic> _$BusinessTypeDataToJson(BusinessTypeData instance) =>
    <String, dynamic>{
      'business_type': instance.businessType,
      'is_cin_required': instance.isCinRequired,
    };
