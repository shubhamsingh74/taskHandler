// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_sales_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceSalesListModel _$InvoiceSalesListModelFromJson(
        Map<String, dynamic> json) =>
    InvoiceSalesListModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => InvoiceSalesListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$InvoiceSalesListModelToJson(
        InvoiceSalesListModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

InvoiceSalesListData _$InvoiceSalesListDataFromJson(
        Map<String, dynamic> json) =>
    InvoiceSalesListData(
      saleRecordId: json['sale_record_id'] as int?,
      customerId: json['customer_id'] as int?,
      totalAmount: json['total_amount'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      time: json['time'] as String?,
      invoiceUrl: json['invoice_url'] as String?,
      customerName: json['customer_name'] as String?,
      itemData: (json['item_data'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$InvoiceSalesListDataToJson(
        InvoiceSalesListData instance) =>
    <String, dynamic>{
      'sale_record_id': instance.saleRecordId,
      'customer_id': instance.customerId,
      'total_amount': instance.totalAmount,
      'date': instance.date?.toIso8601String(),
      'time': instance.time,
      'invoice_url': instance.invoiceUrl,
      'customer_name': instance.customerName,
      'item_data': instance.itemData,
    };
