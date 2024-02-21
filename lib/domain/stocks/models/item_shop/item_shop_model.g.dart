// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemShopModel _$ItemShopModelFromJson(Map<String, dynamic> json) =>
    ItemShopModel(
      success: json['success'] as bool,
      itemShopData: ItemShopData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$ItemShopModelToJson(ItemShopModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.itemShopData,
      'message': instance.message,
      'time': instance.time,
    };

ItemShopData _$ItemShopDataFromJson(Map<String, dynamic> json) => ItemShopData(
      itemId: json['item_id'] as int,
      itemName: json['item_name'] as String,
      itemCode: json['item_code'] as int,
      categoryId: json['category_id'] as int,
      hsnSacCode: json['hsn_sac_code'] as int,
      imageUrl: json['image_url'] as String,
      shopId: json['shop_id'] as int,
      lowStockQuantity: json['low_stock_quantity'] as int,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      categoryName: json['category_name'] as String,
    );

Map<String, dynamic> _$ItemShopDataToJson(ItemShopData instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'item_name': instance.itemName,
      'item_code': instance.itemCode,
      'category_id': instance.categoryId,
      'hsn_sac_code': instance.hsnSacCode,
      'image_url': instance.imageUrl,
      'shop_id': instance.shopId,
      'low_stock_quantity': instance.lowStockQuantity,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'category_name': instance.categoryName,
    };
