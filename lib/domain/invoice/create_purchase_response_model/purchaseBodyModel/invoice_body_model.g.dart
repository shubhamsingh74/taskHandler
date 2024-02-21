// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceBodyModel _$InvoiceBodyModelFromJson(Map<String, dynamic> json) =>
    InvoiceBodyModel(
      shopId: json['shop_id'] as int,
      date: DateTime.parse(json['date'] as String),
      time: json['time'] as String,
      recordType: json['record_type'] as String,
      partyId: json['party_id'] as int,
      additionalCharges: json['additional_charges'] as int,
      additionalDiscount: json['additional_discount'] as int,
      amount: json['amount'] as int,
      gstNo: json['gst_no'] as String,
      cashAmountReceived: json['cash_amount_received'] as int,
      cashNotesReference: json['cash_notes_reference'] as String,
      onlineAmountReceived: json['online_amount_received'] as int,
      onlineNotesReference: json['online_notes_reference'] as String,
      dueAmount: json['due_amount'] as int,
      creditAmount: json['credit_amount'] as int,
      invoiceBodyModelPurchaseItem: (json['items_details_purchase']
              as List<dynamic>)
          .map((e) =>
              InvoiceBodyModelPurchaseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      invoiceBodyModelSaleItem: (json['items_details_sales'] as List<dynamic>)
          .map((e) =>
              InvoiceBodyModelSaleItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvoiceBodyModelToJson(InvoiceBodyModel instance) =>
    <String, dynamic>{
      'shop_id': instance.shopId,
      'date': instance.date.toIso8601String(),
      'time': instance.time,
      'record_type': instance.recordType,
      'party_id': instance.partyId,
      'additional_charges': instance.additionalCharges,
      'additional_discount': instance.additionalDiscount,
      'amount': instance.amount,
      'gst_no': instance.gstNo,
      'cash_amount_received': instance.cashAmountReceived,
      'cash_notes_reference': instance.cashNotesReference,
      'online_amount_received': instance.onlineAmountReceived,
      'online_notes_reference': instance.onlineNotesReference,
      'due_amount': instance.dueAmount,
      'credit_amount': instance.creditAmount,
      'items_details_purchase': instance.invoiceBodyModelPurchaseItem,
      'items_details_sales': instance.invoiceBodyModelSaleItem,
    };

InvoiceBodyModelPurchaseItem _$InvoiceBodyModelPurchaseItemFromJson(
        Map<String, dynamic> json) =>
    InvoiceBodyModelPurchaseItem(
      itemId: json['item_id'] as int,
      quantity: json['quantity'] as int,
      purchasePrice: json['purchase_price'] as int,
      unit: json['unit'] as String,
      mrp: json['mrp'] as int,
    );

Map<String, dynamic> _$InvoiceBodyModelPurchaseItemToJson(
        InvoiceBodyModelPurchaseItem instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'quantity': instance.quantity,
      'purchase_price': instance.purchasePrice,
      'unit': instance.unit,
      'mrp': instance.mrp,
    };

InvoiceBodyModelSaleItem _$InvoiceBodyModelSaleItemFromJson(
        Map<String, dynamic> json) =>
    InvoiceBodyModelSaleItem(
      itemId: json['item_id'] as int,
      quantity: json['quantity'] as int,
      salePrice: json['sale_price'] as int,
      unit: json['unit'] as String,
      discount: json['discount'] as int,
    );

Map<String, dynamic> _$InvoiceBodyModelSaleItemToJson(
        InvoiceBodyModelSaleItem instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'quantity': instance.quantity,
      'sale_price': instance.salePrice,
      'unit': instance.unit,
      'discount': instance.discount,
    };
