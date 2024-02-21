// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockItemsModel _$StockItemsModelFromJson(Map<String, dynamic> json) =>
    StockItemsModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => StockItemsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$StockItemsModelToJson(StockItemsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

StockItemsData _$StockItemsDataFromJson(Map<String, dynamic> json) =>
    StockItemsData(
      itemId: json['item_id'] as int?,
      brand: json['brand'] as String?,
      itemName: json['item_name'] as String?,
      availableStock: json['available_stock'] as int?,
    );

Map<String, dynamic> _$StockItemsDataToJson(StockItemsData instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'item_name': instance.itemName,
      'brand': instance.brand,
      'available_stock': instance.availableStock,
    };
