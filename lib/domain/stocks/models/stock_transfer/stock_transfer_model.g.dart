// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_transfer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockTransferModel _$StockTransferModelFromJson(Map<String, dynamic> json) =>
    StockTransferModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : StockTransferData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$StockTransferModelToJson(StockTransferModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

StockTransferData _$StockTransferDataFromJson(Map<String, dynamic> json) =>
    StockTransferData(
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : AtedAt.fromJson(json['created_at'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] == null
          ? null
          : AtedAt.fromJson(json['updated_at'] as Map<String, dynamic>),
      stockTransferId: json['stock_transfer_id'] as int?,
      sourceShopId: json['source_shop_id'] as int?,
      destinationShopId: json['destination_shop_id'] as int?,
      itemId: json['item_id'] as int?,
      quantity: json['quantity'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$StockTransferDataToJson(StockTransferData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'stock_transfer_id': instance.stockTransferId,
      'source_shop_id': instance.sourceShopId,
      'destination_shop_id': instance.destinationShopId,
      'item_id': instance.itemId,
      'quantity': instance.quantity,
      'date': instance.date?.toIso8601String(),
    };

AtedAt _$AtedAtFromJson(Map<String, dynamic> json) => AtedAt(
      val: json['val'] as String?,
    );

Map<String, dynamic> _$AtedAtToJson(AtedAt instance) => <String, dynamic>{
      'val': instance.val,
    };
