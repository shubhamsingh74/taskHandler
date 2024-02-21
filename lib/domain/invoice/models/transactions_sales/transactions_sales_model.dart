// To parse this JSON data, do
//
//     final transactionsSalesModel = transactionsSalesModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'transactions_sales_model.g.dart';

TransactionsSalesModel transactionsSalesModelFromJson(String str) => TransactionsSalesModel.fromJson(json.decode(str));

String transactionsSalesModelToJson(TransactionsSalesModel data) => json.encode(data.toJson());

@JsonSerializable()
class TransactionsSalesModel {
    @JsonKey(name: "success")
    final bool? success;
    @JsonKey(name: "data")
    final List<TransactionsSalesData>? data;
    @JsonKey(name: "message")
    final String? message;
    @JsonKey(name: "time")
    final String? time;

    TransactionsSalesModel({
        this.success,
        this.data,
        this.message,
        this.time,
    });

    TransactionsSalesModel copyWith({
        bool? success,
        List<TransactionsSalesData>? data,
        String? message,
        String? time,
    }) => 
        TransactionsSalesModel(
            success: success ?? this.success,
            data: data ?? this.data,
            message: message ?? this.message,
            time: time ?? this.time,
        );

    factory TransactionsSalesModel.fromJson(Map<String, dynamic> json) => _$TransactionsSalesModelFromJson(json);

    Map<String, dynamic> toJson() => _$TransactionsSalesModelToJson(this);
}

@JsonSerializable()
class TransactionsSalesData {
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

    TransactionsSalesData({
        this.invoiceNumber,
        this.shopId,
        this.recordType,
        this.amount,
        this.paymentMode,
        this.dueAmount,
        this.paymentStatus,
        this.date,
    });

    TransactionsSalesData copyWith({
        int? invoiceNumber,
        int? shopId,
        String? recordType,
        int? amount,
        String? paymentMode,
        int? dueAmount,
        String? paymentStatus,
        DateTime? date,
    }) => 
        TransactionsSalesData(
            invoiceNumber: invoiceNumber ?? this.invoiceNumber,
            shopId: shopId ?? this.shopId,
            recordType: recordType ?? this.recordType,
            amount: amount ?? this.amount,
            paymentMode: paymentMode ?? this.paymentMode,
            dueAmount: dueAmount ?? this.dueAmount,
            paymentStatus: paymentStatus ?? this.paymentStatus,
            date: date ?? this.date,
        );

    factory TransactionsSalesData.fromJson(Map<String, dynamic> json) => _$TransactionsSalesDataFromJson(json);

    Map<String, dynamic> toJson() => _$TransactionsSalesDataToJson(this);
}
