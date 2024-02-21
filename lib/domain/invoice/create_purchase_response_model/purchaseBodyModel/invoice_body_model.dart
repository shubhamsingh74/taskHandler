// To parse this JSON data, do
//
//     final invoiceBodyModel = invoiceBodyModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'invoice_body_model.g.dart';

InvoiceBodyModel invoiceBodyModelFromJson(String str) => InvoiceBodyModel.fromJson(json.decode(str));

String invoiceBodyModelToJson(InvoiceBodyModel data) => json.encode(data.toJson());

@JsonSerializable()
class InvoiceBodyModel {
    @JsonKey(name: "shop_id")
    int shopId;
    @JsonKey(name: "date")
    DateTime date;
    @JsonKey(name: "time")
    String time;
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
    @JsonKey(name: "gst_no")
    String gstNo;
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
    @JsonKey(name: "items_details_purchase")
    List<InvoiceBodyModelPurchaseItem> invoiceBodyModelPurchaseItem;
    @JsonKey(name: "items_details_sales")
    List<InvoiceBodyModelSaleItem> invoiceBodyModelSaleItem;

    InvoiceBodyModel({
        required this.shopId,
        required this.date,
        required this.time,
        required this.recordType,
        required this.partyId,
        required this.additionalCharges,
        required this.additionalDiscount,
        required this.amount,
        required this.gstNo,
        required this.cashAmountReceived,
        required this.cashNotesReference,
        required this.onlineAmountReceived,
        required this.onlineNotesReference,
        required this.dueAmount,
        required this.creditAmount,
        required this.invoiceBodyModelPurchaseItem,
        required this.invoiceBodyModelSaleItem,
    });

    InvoiceBodyModel copyWith({
        int? shopId,
        DateTime? date,
        String? time,
        String? recordType,
        int? partyId,
        int? additionalCharges,
        int? additionalDiscount,
        int? amount,
        String? gstNo,
        int? cashAmountReceived,
        String? cashNotesReference,
        int? onlineAmountReceived,
        String? onlineNotesReference,
        int? dueAmount,
        int? creditAmount,
        List<InvoiceBodyModelPurchaseItem>? invoiceBodyModelPurchaseItem,
        List<InvoiceBodyModelSaleItem>? invoiceBodyModelSaleItem,
    }) => 
        InvoiceBodyModel(
            shopId: shopId ?? this.shopId,
            date: date ?? this.date,
            time: time ?? this.time,
            recordType: recordType ?? this.recordType,
            partyId: partyId ?? this.partyId,
            additionalCharges: additionalCharges ?? this.additionalCharges,
            additionalDiscount: additionalDiscount ?? this.additionalDiscount,
            amount: amount ?? this.amount,
            gstNo: gstNo ?? this.gstNo,
            cashAmountReceived: cashAmountReceived ?? this.cashAmountReceived,
            cashNotesReference: cashNotesReference ?? this.cashNotesReference,
            onlineAmountReceived: onlineAmountReceived ?? this.onlineAmountReceived,
            onlineNotesReference: onlineNotesReference ?? this.onlineNotesReference,
            dueAmount: dueAmount ?? this.dueAmount,
            creditAmount: creditAmount ?? this.creditAmount,
            invoiceBodyModelPurchaseItem: invoiceBodyModelPurchaseItem ?? this.invoiceBodyModelPurchaseItem,
            invoiceBodyModelSaleItem: invoiceBodyModelSaleItem ?? this.invoiceBodyModelSaleItem,
        );

    factory InvoiceBodyModel.fromJson(Map<String, dynamic> json) => _$InvoiceBodyModelFromJson(json);

    Map<String, dynamic> toJson() => _$InvoiceBodyModelToJson(this);
}

@JsonSerializable()
class InvoiceBodyModelPurchaseItem {
    @JsonKey(name: "item_id")
    int itemId;
    @JsonKey(name: "quantity")
    int quantity;
    @JsonKey(name: "purchase_price")
    int purchasePrice;
    @JsonKey(name: "unit")
    String unit;
    @JsonKey(name: "mrp")
    int mrp;

    InvoiceBodyModelPurchaseItem({
        required this.itemId,
        required this.quantity,
        required this.purchasePrice,
        required this.unit,
        required this.mrp,
    });

    InvoiceBodyModelPurchaseItem copyWith({
        int? itemId,
        int? quantity,
        int? purchasePrice,
        String? unit,
        int? mrp,
    }) => 
        InvoiceBodyModelPurchaseItem(
            itemId: itemId ?? this.itemId,
            quantity: quantity ?? this.quantity,
            purchasePrice: purchasePrice ?? this.purchasePrice,
            unit: unit ?? this.unit,
            mrp: mrp ?? this.mrp,
        );

    factory InvoiceBodyModelPurchaseItem.fromJson(Map<String, dynamic> json) => _$InvoiceBodyModelPurchaseItemFromJson(json);

    Map<String, dynamic> toJson() => _$InvoiceBodyModelPurchaseItemToJson(this);
}

@JsonSerializable()
class InvoiceBodyModelSaleItem {
    @JsonKey(name: "item_id")
    int itemId;
    @JsonKey(name: "quantity")
    int quantity;
    @JsonKey(name: "sale_price")
    int salePrice;
    @JsonKey(name: "unit")
    String unit;
    @JsonKey(name: "discount")
    int discount;

    InvoiceBodyModelSaleItem({
        required this.itemId,
        required this.quantity,
        required this.salePrice,
        required this.unit,
        required this.discount,
    });

    InvoiceBodyModelSaleItem copyWith({
        int? itemId,
        int? quantity,
        int? salePrice,
        String? unit,
        int? discount,
    }) => 
        InvoiceBodyModelSaleItem(
            itemId: itemId ?? this.itemId,
            quantity: quantity ?? this.quantity,
            salePrice: salePrice ?? this.salePrice,
            unit: unit ?? this.unit,
            discount: discount ?? this.discount,
        );

    factory InvoiceBodyModelSaleItem.fromJson(Map<String, dynamic> json) => _$InvoiceBodyModelSaleItemFromJson(json);

    Map<String, dynamic> toJson() => _$InvoiceBodyModelSaleItemToJson(this);
}
