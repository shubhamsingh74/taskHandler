// To parse this JSON data, do
//
//     final createdInvoiceResponseModel = createdInvoiceResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'created_invoice_response_model.g.dart';

CreatedInvoiceResponseModel createdInvoiceResponseModelFromJson(String str) => CreatedInvoiceResponseModel.fromJson(json.decode(str));

String createdInvoiceResponseModelToJson(CreatedInvoiceResponseModel data) => json.encode(data.toJson());

@JsonSerializable()
class CreatedInvoiceResponseModel {
    @JsonKey(name: "success")
    bool success;
    @JsonKey(name: "data")
    CreatePurchaseResponseData data;
    @JsonKey(name: "message")
    String message;
    @JsonKey(name: "time")
    String time;

    CreatedInvoiceResponseModel({
        required this.success,
        required this.data,
        required this.message,
        required this.time,
    });

    CreatedInvoiceResponseModel copyWith({
        bool? success,
        CreatePurchaseResponseData? data,
        String? message,
        String? time,
    }) => 
        CreatedInvoiceResponseModel(
            success: success ?? this.success,
            data: data ?? this.data,
            message: message ?? this.message,
            time: time ?? this.time,
        );

    factory CreatedInvoiceResponseModel.fromJson(Map<String, dynamic> json) => _$CreatedInvoiceResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$CreatedInvoiceResponseModelToJson(this);
}

@JsonSerializable()
class CreatePurchaseResponseData {
    @JsonKey(name: "status")
    String status;
    @JsonKey(name: "created_at")
    AtedAt createdAt;
    @JsonKey(name: "updated_at")
    AtedAt updatedAt;
    @JsonKey(name: "invoice_id")
    int invoiceId;
    @JsonKey(name: "invoice_url")
    String invoiceUrl;
    @JsonKey(name: "shop_id")
    int shopId;
    @JsonKey(name: "date")
    DateTime date;
    @JsonKey(name: "record_type")
    String recordType;
    @JsonKey(name: "party_id")
    int partyId;
    @JsonKey(name: "additional_charges")
    int additionalCharges;
    @JsonKey(name: "additional_discount")
    int additionalDiscount;
    @JsonKey(name: "amount")
    int amount;
    @JsonKey(name: "cash_amount_received")
    int cashAmountReceived;
    @JsonKey(name: "cash_notes_reference")
    String cashNotesReference;
    @JsonKey(name: "online_amount_received")
    int onlineAmountReceived;
    @JsonKey(name: "online_notes_reference")
    String onlineNotesReference;
    @JsonKey(name: "due_amount")
    int dueAmount;
    @JsonKey(name: "credit_amount")
    int creditAmount;

    CreatePurchaseResponseData({
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.invoiceId,
        required this.invoiceUrl,
        required this.shopId,
        required this.date,
        required this.recordType,
        required this.partyId,
        required this.additionalCharges,
        required this.additionalDiscount,
        required this.amount,
        required this.cashAmountReceived,
        required this.cashNotesReference,
        required this.onlineAmountReceived,
        required this.onlineNotesReference,
        required this.dueAmount,
        required this.creditAmount,
    });

    CreatePurchaseResponseData copyWith({
        String? status,
        AtedAt? createdAt,
        AtedAt? updatedAt,
        int? invoiceId,
        String? invoiceUrl,
        int? shopId,
        DateTime? date,
        String? recordType,
        int? partyId,
        int? additionalCharges,
        int? additionalDiscount,
        int? amount,
        int? cashAmountReceived,
        String? cashNotesReference,
        int? onlineAmountReceived,
        String? onlineNotesReference,
        int? dueAmount,
        int? creditAmount,
    }) => 
        CreatePurchaseResponseData(
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            invoiceId: invoiceId ?? this.invoiceId,
            invoiceUrl: invoiceUrl ?? this.invoiceUrl,
            shopId: shopId ?? this.shopId,
            date: date ?? this.date,
            recordType: recordType ?? this.recordType,
            partyId: partyId ?? this.partyId,
            additionalCharges: additionalCharges ?? this.additionalCharges,
            additionalDiscount: additionalDiscount ?? this.additionalDiscount,
            amount: amount ?? this.amount,
            cashAmountReceived: cashAmountReceived ?? this.cashAmountReceived,
            cashNotesReference: cashNotesReference ?? this.cashNotesReference,
            onlineAmountReceived: onlineAmountReceived ?? this.onlineAmountReceived,
            onlineNotesReference: onlineNotesReference ?? this.onlineNotesReference,
            dueAmount: dueAmount ?? this.dueAmount,
            creditAmount: creditAmount ?? this.creditAmount,
        );

    factory CreatePurchaseResponseData.fromJson(Map<String, dynamic> json) => _$CreatePurchaseResponseDataFromJson(json);

    Map<String, dynamic> toJson() => _$CreatePurchaseResponseDataToJson(this);
}

@JsonSerializable()
class AtedAt {
    @JsonKey(name: "val")
    String val;

    AtedAt({
        required this.val,
    });

    AtedAt copyWith({
        String? val,
    }) => 
        AtedAt(
            val: val ?? this.val,
        );

    factory AtedAt.fromJson(Map<String, dynamic> json) => _$AtedAtFromJson(json);

    Map<String, dynamic> toJson() => _$AtedAtToJson(this);
}
