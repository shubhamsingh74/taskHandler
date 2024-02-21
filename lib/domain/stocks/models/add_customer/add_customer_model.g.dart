// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCustomerModel _$AddCustomerModelFromJson(Map<String, dynamic> json) =>
    AddCustomerModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : AddCustomerData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$AddCustomerModelToJson(AddCustomerModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

AddCustomerData _$AddCustomerDataFromJson(Map<String, dynamic> json) =>
    AddCustomerData(
      customerType: json['customer_type'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : AtedAt.fromJson(json['created_at'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] == null
          ? null
          : AtedAt.fromJson(json['updated_at'] as Map<String, dynamic>),
      businessCustomerId: json['business_customer_id'] as int?,
      createdBy: json['created_by'] as int?,
      name: json['name'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      email: json['email'] as String?,
      addressId: json['address_id'] as int?,
      categoryId: json['category_id'] as String?,
      pan: json['pan'] as String?,
      gstNo: json['gst_no'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$AddCustomerDataToJson(AddCustomerData instance) =>
    <String, dynamic>{
      'customer_type': instance.customerType,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'business_customer_id': instance.businessCustomerId,
      'created_by': instance.createdBy,
      'name': instance.name,
      'mobile_number': instance.mobileNumber,
      'email': instance.email,
      'address_id': instance.addressId,
      'category_id': instance.categoryId,
      'pan': instance.pan,
      'gst_no': instance.gstNo,
      'status': instance.status,
    };

AtedAt _$AtedAtFromJson(Map<String, dynamic> json) => AtedAt(
      val: json['val'] as String?,
    );

Map<String, dynamic> _$AtedAtToJson(AtedAt instance) => <String, dynamic>{
      'val': instance.val,
    };
