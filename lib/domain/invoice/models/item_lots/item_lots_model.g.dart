// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_lots_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemLotsModel _$ItemLotsModelFromJson(Map<String, dynamic> json) =>
    ItemLotsModel(
      success: json['success'] as bool,
      lotsDataDatum: (json['data'] as List<dynamic>)
          .map((e) => LotsDataDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$ItemLotsModelToJson(ItemLotsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.lotsDataDatum,
      'message': instance.message,
      'time': instance.time,
    };

LotsDataDatum _$LotsDataDatumFromJson(Map<String, dynamic> json) =>
    LotsDataDatum(
      itemLotId: json['item_lot_id'] as int,
      lotName: json['lot_name'] as String,
      itemId: json['item_id'] as int,
      itemInPurchaseId: json['item_in_purchase_id'] as int,
      unit: json['unit'] as String,
      date: DateTime.parse(json['date'] as String),
      purchasePrice: json['purchase_price'] as int,
      mrp: json['mrp'] as int,
      initialQuantity: json['initial_quantity'] as int,
      consumedQuantity: json['consumed_quantity'] as int,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$LotsDataDatumToJson(LotsDataDatum instance) =>
    <String, dynamic>{
      'item_lot_id': instance.itemLotId,
      'lot_name': instance.lotName,
      'item_id': instance.itemId,
      'item_in_purchase_id': instance.itemInPurchaseId,
      'unit': instance.unit,
      'date': instance.date.toIso8601String(),
      'purchase_price': instance.purchasePrice,
      'mrp': instance.mrp,
      'initial_quantity': instance.initialQuantity,
      'consumed_quantity': instance.consumedQuantity,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
