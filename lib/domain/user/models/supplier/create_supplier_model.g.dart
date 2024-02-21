// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_supplier_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSupplierModel _$CreateSupplierModelFromJson(Map<String, dynamic> json) =>
    CreateSupplierModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : CreateSupplierData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$CreateSupplierModelToJson(
        CreateSupplierModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

CreateSupplierData _$CreateSupplierDataFromJson(Map<String, dynamic> json) =>
    CreateSupplierData(
      createdAt: json['created_at'] == null
          ? null
          : AtedAt.fromJson(json['created_at'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] == null
          ? null
          : AtedAt.fromJson(json['updated_at'] as Map<String, dynamic>),
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
    );

Map<String, dynamic> _$CreateSupplierDataToJson(CreateSupplierData instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
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
    };

AtedAt _$AtedAtFromJson(Map<String, dynamic> json) => AtedAt(
      val: json['val'] as String?,
    );

Map<String, dynamic> _$AtedAtToJson(AtedAt instance) => <String, dynamic>{
      'val': instance.val,
    };
