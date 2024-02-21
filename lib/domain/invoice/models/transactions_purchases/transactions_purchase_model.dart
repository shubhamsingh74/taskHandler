// To parse this JSON data, do
//
//     final transactionsPurchaseModel = transactionsPurchaseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'transactions_purchase_model.g.dart';

TransactionsPurchaseModel transactionsPurchaseModelFromJson(String str) =>
    TransactionsPurchaseModel.fromJson(json.decode(str));

String transactionsPurchaseModelToJson(TransactionsPurchaseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class TransactionsPurchaseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final List<TransactionsPurchaseData>? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  TransactionsPurchaseModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  TransactionsPurchaseModel copyWith({
    bool? success,
    List<TransactionsPurchaseData>? data,
    String? message,
    String? time,
  }) =>
      TransactionsPurchaseModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory TransactionsPurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionsPurchaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsPurchaseModelToJson(this);
}

@JsonSerializable()
class TransactionsPurchaseData {
  @JsonKey(name: "invoice_number")
  final int? invoiceNumber;
  @JsonKey(name: "shop_id")
  final int? shopId;
  @JsonKey(name: "record_type")
  final String? recordType;
  @JsonKey(name: "amount")
  final int? amount;
  @JsonKey(name: "payment_mode")
  final String? paymentMode;
  @JsonKey(name: "due_amount")
  final int? dueAmount;
  @JsonKey(name: "payment_status")
  final String? paymentStatus;
  @JsonKey(name: "date")
  final DateTime? date;

  TransactionsPurchaseData({
    this.invoiceNumber,
    this.shopId,
    this.recordType,
    this.amount,
    this.paymentMode,
    this.dueAmount,
    this.paymentStatus,
    this.date,
  });

  TransactionsPurchaseData copyWith({
    int? invoiceNumber,
    int? shopId,
    String? recordType,
    int? amount,
    String? paymentMode,
    int? dueAmount,
    String? paymentStatus,
    DateTime? date,
  }) =>
      TransactionsPurchaseData(
        invoiceNumber: invoiceNumber ?? this.invoiceNumber,
        shopId: shopId ?? this.shopId,
        recordType: recordType ?? this.recordType,
        amount: amount ?? this.amount,
        paymentMode: paymentMode ?? this.paymentMode,
        dueAmount: dueAmount ?? this.dueAmount,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        date: date ?? this.date,
      );

  factory TransactionsPurchaseData.fromJson(Map<String, dynamic> json) =>
      _$TransactionsPurchaseDataFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsPurchaseDataToJson(this);
}
