// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_purchase_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoicePurchaseListModel _$InvoicePurchaseListModelFromJson(
        Map<String, dynamic> json) =>
    InvoicePurchaseListModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              InvoicePurchaseListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$InvoicePurchaseListModelToJson(
        InvoicePurchaseListModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

InvoicePurchaseListData _$InvoicePurchaseListDataFromJson(
        Map<String, dynamic> json) =>
    InvoicePurchaseListData(
      purchaseRecordId: json['purchase_record_id'] as int?,
      supplierId: json['supplier_id'] as int?,
      totalAmount: json['total_amount'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      time: json['time'] as String?,
      invoiceUrl: json['invoice_url'] as String?,
      supplierName: json['supplier_name'] as String?,
      itemData: (json['item_data'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$InvoicePurchaseListDataToJson(
        InvoicePurchaseListData instance) =>
    <String, dynamic>{
      'purchase_record_id': instance.purchaseRecordId,
      'supplier_id': instance.supplierId,
      'total_amount': instance.totalAmount,
      'date': instance.date?.toIso8601String(),
      'time': instance.time,
      'invoice_url': instance.invoiceUrl,
      'supplier_name': instance.supplierName,
      'item_data': instance.itemData,
    };
