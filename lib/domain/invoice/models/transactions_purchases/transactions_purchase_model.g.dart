// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_purchase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionsPurchaseModel _$TransactionsPurchaseModelFromJson(
        Map<String, dynamic> json) =>
    TransactionsPurchaseModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              TransactionsPurchaseData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$TransactionsPurchaseModelToJson(
        TransactionsPurchaseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

TransactionsPurchaseData _$TransactionsPurchaseDataFromJson(
        Map<String, dynamic> json) =>
    TransactionsPurchaseData(
      invoiceNumber: json['invoice_number'] as int?,
      shopId: json['shop_id'] as int?,
      recordType: json['record_type'] as String?,
      amount: json['amount'] as int?,
      paymentMode: json['payment_mode'] as String?,
      dueAmount: json['due_amount'] as int?,
      paymentStatus: json['payment_status'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$TransactionsPurchaseDataToJson(
        TransactionsPurchaseData instance) =>
    <String, dynamic>{
      'invoice_number': instance.invoiceNumber,
      'shop_id': instance.shopId,
      'record_type': instance.recordType,
      'amount': instance.amount,
      'payment_mode': instance.paymentMode,
      'due_amount': instance.dueAmount,
      'payment_status': instance.paymentStatus,
      'date': instance.date?.toIso8601String(),
    };
