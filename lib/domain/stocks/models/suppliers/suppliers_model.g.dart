// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suppliers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuppliersModel _$SuppliersModelFromJson(Map<String, dynamic> json) =>
    SuppliersModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SuppliersDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$SuppliersModelToJson(SuppliersModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

SuppliersDatum _$SuppliersDatumFromJson(Map<String, dynamic> json) =>
    SuppliersDatum(
      businessSupplierId: json['business_supplier_id'] as int?,
      createdBy: json['created_by'] as int?,
      categoryId: json['category_id'] as int?,
      name: json['name'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      email: json['email'] as String?,
      pan: json['pan'] as String?,
      gstNo: json['gst_no'] as String?,
      addressId: json['address_id'] as int?,
      remarks: json['remarks'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$SuppliersDatumToJson(SuppliersDatum instance) =>
    <String, dynamic>{
      'business_supplier_id': instance.businessSupplierId,
      'created_by': instance.createdBy,
      'category_id': instance.categoryId,
      'name': instance.name,
      'mobile_number': instance.mobileNumber,
      'email': instance.email,
      'pan': instance.pan,
      'gst_no': instance.gstNo,
      'address_id': instance.addressId,
      'remarks': instance.remarks,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
