// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockCreateItemModel _$StockCreateItemModelFromJson(
        Map<String, dynamic> json) =>
    StockCreateItemModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : CreateItemData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$StockCreateItemModelToJson(
        StockCreateItemModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

CreateItemData _$CreateItemDataFromJson(Map<String, dynamic> json) =>
    CreateItemData(
      createdAt: json['created_at'] == null
          ? null
          : AtedAt.fromJson(json['created_at'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] == null
          ? null
          : AtedAt.fromJson(json['updated_at'] as Map<String, dynamic>),
      itemInShopId: json['item_in_shop_id'] as int?,
      itemId: json['item_id'] as int?,
      shopId: json['shop_id'] as int?,
      availableStock: json['available_stock'] as int?,
      lowAlertUnits: json['low_alert_units'] as int?,
      lowAlertStatus: json['low_alert_status'] as bool?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CreateItemDataToJson(CreateItemData instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'item_in_shop_id': instance.itemInShopId,
      'item_id': instance.itemId,
      'shop_id': instance.shopId,
      'available_stock': instance.availableStock,
      'low_alert_units': instance.lowAlertUnits,
      'low_alert_status': instance.lowAlertStatus,
      'status': instance.status,
    };

AtedAt _$AtedAtFromJson(Map<String, dynamic> json) => AtedAt(
      val: json['val'] as String?,
    );

Map<String, dynamic> _$AtedAtToJson(AtedAt instance) => <String, dynamic>{
      'val': instance.val,
    };
