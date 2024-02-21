// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomersModel _$CustomersModelFromJson(Map<String, dynamic> json) =>
    CustomersModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CustomersDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$CustomersModelToJson(CustomersModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

CustomersDatum _$CustomersDatumFromJson(Map<String, dynamic> json) =>
    CustomersDatum(
      businessCustomerId: json['business_customer_id'] as int?,
      createdBy: json['created_by'] as int?,
      name: json['name'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      email: json['email'] as String?,
      addressId: json['address_id'] as int?,
      customerType: json['customer_type'] as String?,
      dob: json['dob'],
      companyName: json['company_name'],
      categoryId: json['category_id'] as int?,
      gstNo: json['gst_no'] as String?,
      pan: json['pan'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CustomersDatumToJson(CustomersDatum instance) =>
    <String, dynamic>{
      'business_customer_id': instance.businessCustomerId,
      'created_by': instance.createdBy,
      'name': instance.name,
      'mobile_number': instance.mobileNumber,
      'email': instance.email,
      'address_id': instance.addressId,
      'customer_type': instance.customerType,
      'dob': instance.dob,
      'company_name': instance.companyName,
      'category_id': instance.categoryId,
      'gst_no': instance.gstNo,
      'pan': instance.pan,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
