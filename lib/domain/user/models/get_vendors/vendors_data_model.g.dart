// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendors_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorsModel _$VendorsModelFromJson(Map<String, dynamic> json) => VendorsModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => VendorsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$VendorsModelToJson(VendorsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

VendorsData _$VendorsDataFromJson(Map<String, dynamic> json) => VendorsData(
      businessId: json['business_id'] as int?,
      businessName: json['business_name'] as String?,
      businessType: json['business_type'] as String?,
      cin: json['cin'],
      pan: json['pan'] as String?,
      gstIn: json['gst_in'] as String?,
    );

Map<String, dynamic> _$VendorsDataToJson(VendorsData instance) =>
    <String, dynamic>{
      'business_id': instance.businessId,
      'business_name': instance.businessName,
      'business_type': instance.businessType,
      'cin': instance.cin,
      'pan': instance.pan,
      'gst_in': instance.gstIn,
    };
