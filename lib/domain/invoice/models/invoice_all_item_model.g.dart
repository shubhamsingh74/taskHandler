// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_all_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceAllItemModel _$InvoiceAllItemModelFromJson(Map<String, dynamic> json) =>
    InvoiceAllItemModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => InvoiceAllItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$InvoiceAllItemModelToJson(
        InvoiceAllItemModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

InvoiceAllItemData _$InvoiceAllItemDataFromJson(Map<String, dynamic> json) =>
    InvoiceAllItemData(
      itemId: json['item_id'] as int?,
      itemName: json['item_name'] as String?,
      brand: json['brand'] as String?,
      purchasePrice: (json['purchase_price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$InvoiceAllItemDataToJson(InvoiceAllItemData instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'item_name': instance.itemName,
      'brand': instance.brand,
      'purchase_price': instance.purchasePrice,
    };
