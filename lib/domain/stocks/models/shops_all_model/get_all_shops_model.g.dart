// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_shops_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllShopsModel _$GetAllShopsModelFromJson(Map<String, dynamic> json) =>
    GetAllShopsModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GetAllShopsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$GetAllShopsModelToJson(GetAllShopsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

GetAllShopsData _$GetAllShopsDataFromJson(Map<String, dynamic> json) =>
    GetAllShopsData(
      shopId: json['shop_id'] as int?,
      businessId: json['business_id'] as int?,
      shopName: json['shop_name'] as String?,
      shopColour: json['shop_colour'] as String?,
      addressId: json['address_id'] as int?,
      isWarehouse: json['is_warehouse'] as bool?,
      gstIn: json['gst_in'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllShopsDataToJson(GetAllShopsData instance) =>
    <String, dynamic>{
      'shop_id': instance.shopId,
      'business_id': instance.businessId,
      'shop_name': instance.shopName,
      'shop_colour': instance.shopColour,
      'address_id': instance.addressId,
      'is_warehouse': instance.isWarehouse,
      'gst_in': instance.gstIn,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'address': instance.address,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      addressId: json['address_id'] as int?,
      streetAddress: json['street_address'] as String?,
      pincode: json['pincode'] as int?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'address_id': instance.addressId,
      'street_address': instance.streetAddress,
      'pincode': instance.pincode,
      'city': instance.city,
      'state': instance.state,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
