// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_invoice_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedInvoiceResponseModel _$CreatedInvoiceResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreatedInvoiceResponseModel(
      success: json['success'] as bool,
      data: CreatePurchaseResponseData.fromJson(
          json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$CreatedInvoiceResponseModelToJson(
        CreatedInvoiceResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

CreatePurchaseResponseData _$CreatePurchaseResponseDataFromJson(
        Map<String, dynamic> json) =>
    CreatePurchaseResponseData(
      status: json['status'] as String,
      createdAt: AtedAt.fromJson(json['created_at'] as Map<String, dynamic>),
      updatedAt: AtedAt.fromJson(json['updated_at'] as Map<String, dynamic>),
      invoiceId: json['invoice_id'] as int,
      invoiceUrl: json['invoice_url'] as String,
      shopId: json['shop_id'] as int,
      date: DateTime.parse(json['date'] as String),
      recordType: json['record_type'] as String,
      partyId: json['party_id'] as int,
      additionalCharges: json['additional_charges'] as int,
      additionalDiscount: json['additional_discount'] as int,
      amount: json['amount'] as int,
      cashAmountReceived: json['cash_amount_received'] as int,
      cashNotesReference: json['cash_notes_reference'] as String,
      onlineAmountReceived: json['online_amount_received'] as int,
      onlineNotesReference: json['online_notes_reference'] as String,
      dueAmount: json['due_amount'] as int,
      creditAmount: json['credit_amount'] as int,
    );

Map<String, dynamic> _$CreatePurchaseResponseDataToJson(
        CreatePurchaseResponseData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'invoice_id': instance.invoiceId,
      'invoice_url': instance.invoiceUrl,
      'shop_id': instance.shopId,
      'date': instance.date.toIso8601String(),
      'record_type': instance.recordType,
      'party_id': instance.partyId,
      'additional_charges': instance.additionalCharges,
      'additional_discount': instance.additionalDiscount,
      'amount': instance.amount,
      'cash_amount_received': instance.cashAmountReceived,
      'cash_notes_reference': instance.cashNotesReference,
      'online_amount_received': instance.onlineAmountReceived,
      'online_notes_reference': instance.onlineNotesReference,
      'due_amount': instance.dueAmount,
      'credit_amount': instance.creditAmount,
    };

AtedAt _$AtedAtFromJson(Map<String, dynamic> json) => AtedAt(
      val: json['val'] as String,
    );

Map<String, dynamic> _$AtedAtToJson(AtedAt instance) => <String, dynamic>{
      'val': instance.val,
    };
