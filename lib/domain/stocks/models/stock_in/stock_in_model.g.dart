// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_in_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockInModel _$StockInModelFromJson(Map<String, dynamic> json) => StockInModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$StockInModelToJson(StockInModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      cashAmountPaid: json['cash_amount_paid'] as int?,
      onlineAmountPaid: json['online_amount_paid'] as int?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : AtedAt.fromJson(json['created_at'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] == null
          ? null
          : AtedAt.fromJson(json['updated_at'] as Map<String, dynamic>),
      stockInRecordId: json['stock_in_record_id'] as int?,
      itemId: json['item_id'] as int?,
      shopId: json['shop_id'] as int?,
      supplierId: json['supplier_id'] as int?,
      quantity: json['quantity'] as int?,
      purchasePrice: (json['purchase_price'] as num?)?.toDouble(),
      gstPercentage: json['gst_percentage'] as int?,
      totalAmount: (json['total_amount'] as num?)?.toDouble(),
      dueAmount: json['due_amount'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      invoiceNumber: json['invoice_number'] as int?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'cash_amount_paid': instance.cashAmountPaid,
      'online_amount_paid': instance.onlineAmountPaid,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'stock_in_record_id': instance.stockInRecordId,
      'item_id': instance.itemId,
      'shop_id': instance.shopId,
      'supplier_id': instance.supplierId,
      'quantity': instance.quantity,
      'purchase_price': instance.purchasePrice,
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
