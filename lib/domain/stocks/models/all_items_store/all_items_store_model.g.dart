// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_items_store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllItemsOfStore _$AllItemsOfStoreFromJson(Map<String, dynamic> json) =>
    AllItemsOfStore(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AllItemsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$AllItemsOfStoreToJson(AllItemsOfStore instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

AllItemsData _$AllItemsDataFromJson(Map<String, dynamic> json) => AllItemsData(
      itemId: json['item_id'] as int?,
      itemName: json['item_name'] as String?,
      itemCode: json['item_code'] as int?,
      categoryId: json['category_id'] as int?,
      brand: json['brand'] as String?,
      hsnSacCode: json['hsn_sac_code'] as int?,
      shopId: json['shop_id'] as int?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      units:
          (json['units'] as List<dynamic>?)?.map((e) => e as String).toList(),
      categoryName:
          $enumDecodeNullable(_$CategoryNameEnumMap, json['category_name']),
    );

Map<String, dynamic> _$AllItemsDataToJson(AllItemsData instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'item_name': instance.itemName,
      'item_code': instance.itemCode,
      'category_id': instance.categoryId,
      'brand': instance.brand,
      'hsn_sac_code': instance.hsnSacCode,
      'shop_id': instance.shopId,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'units': instance.units,
      'category_name': _$CategoryNameEnumMap[instance.categoryName],
    };

const _$CategoryNameEnumMap = {
  CategoryName.ELECTRONICS: 'Electronics',
  CategoryName.GROCERY: 'Grocery',
  CategoryName.STATIONERY: 'Stationery',
};
