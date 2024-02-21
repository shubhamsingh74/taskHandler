// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockOutModel _$StockOutModelFromJson(Map<String, dynamic> json) =>
    StockOutModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : StockOutData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$StockOutModelToJson(StockOutModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

StockOutData _$StockOutDataFromJson(Map<String, dynamic> json) => StockOutData(
      cashAmountReceived: json['cash_amount_received'] as int?,
      onlineAmountReceived: json['online_amount_received'] as int?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : AtedAt.fromJson(json['created_at'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] == null
          ? null
          : AtedAt.fromJson(json['updated_at'] as Map<String, dynamic>),
      stockOutRecordId: json['stock_out_record_id'] as int?,
      itemId: json['item_id'] as int?,
      shopId: json['shop_id'] as int?,
      customerId: json['customer_id'] as int?,
      quantity: json['quantity'] as int?,
      salesPrice: (json['sales_price'] as num?)?.toDouble(),
      gstPercentage: json['gst_percentage'] as int?,
      totalAmount: (json['total_amount'] as num?)?.toDouble(),
      dueAmount: json['due_amount'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      invoiceNumber: json['invoice_number'] as int?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$StockOutDataToJson(StockOutData instance) =>
    <String, dynamic>{
      'cash_amount_received': instance.cashAmountReceived,
      'online_amount_received': instance.onlineAmountReceived,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'stock_out_record_id': instance.stockOutRecordId,
      'item_id': instance.itemId,
      'shop_id': instance.shopId,
      'customer_id': instance.customerId,
      'quantity': instance.quantity,
      'sales_price': instance.salesPrice,
      'gst_percentage': instance.gstPercentage,
      'total_amount': instance.totalAmount,
      'due_amount': instance.dueAmount,
      'date': instance.date?.toIso8601String(),
      'invoice_number': instance.invoiceNumber,
      'remarks': instance.remarks,
    };

AtedAt _$AtedAtFromJson(Map<String, dynamic> json) => AtedAt(
      val: json['val'] as String?,
    );

Map<String, dynamic> _$AtedAtToJson(AtedAt instance) => <String, dynamic>{
      'val': instance.val,
    };
