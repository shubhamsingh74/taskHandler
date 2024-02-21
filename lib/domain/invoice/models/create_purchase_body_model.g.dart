// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_purchase_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePurchaseBodyModel _$CreatePurchaseBodyModelFromJson(
        Map<String, dynamic> json) =>
    CreatePurchaseBodyModel(
      supplierId: json['supplier_id'] as int?,
      shopId: json['shop_id'] as int?,
      itemsDetails: (json['items_details'] as List<dynamic>?)
          ?.map((e) =>
              CreatePurchaseItemsDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      gstPercentage: json['gst_percentage'] as int?,
      cashAmountRecieved: json['cash_amount_recieved'] as int?,
      onlineAmountRecieved: json['online_amount_recieved'] as int?,
      dueAmount: json['due_amount'] as int?,
      remarks: json['remarks'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$CreatePurchaseBodyModelToJson(
        CreatePurchaseBodyModel instance) =>
    <String, dynamic>{
      'supplier_id': instance.supplierId,
      'shop_id': instance.shopId,
      'items_details': instance.itemsDetails,
      'gst_percentage': instance.gstPercentage,
      'cash_amount_recieved': instance.cashAmountRecieved,
      'online_amount_recieved': instance.onlineAmountRecieved,
      'due_amount': instance.dueAmount,
      'remarks': instance.remarks,
      'date': instance.date,
      'time': instance.time,
    };

CreatePurchaseItemsDetail _$CreatePurchaseItemsDetailFromJson(
        Map<String, dynamic> json) =>
    CreatePurchaseItemsDetail(
      itemId: json['item_id'] as int?,
      quantity: json['quantity'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      date: json['date'] as String?,
    );

Map<String, dynamic> _$CreatePurchaseItemsDetailToJson(
        CreatePurchaseItemsDetail instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'quantity': instance.quantity,
      'price': instance.price,
      'date': instance.date,
    };
