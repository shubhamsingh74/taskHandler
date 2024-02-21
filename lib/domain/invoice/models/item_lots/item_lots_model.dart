// To parse this JSON lotsDataDatum, do
//
//     final itemLotsModel = itemLotsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'item_lots_model.g.dart';

ItemLotsModel itemLotsModelFromJson(String str) => ItemLotsModel.fromJson(json.decode(str));

String itemLotsModelToJson(ItemLotsModel lotsDataDatum) => json.encode(lotsDataDatum.toJson());

@JsonSerializable()
class ItemLotsModel {
    @JsonKey(name: "success")
    bool success;
    @JsonKey(name: "data")
    List<LotsDataDatum> lotsDataDatum;
    @JsonKey(name: "message")
    String message;
    @JsonKey(name: "time")
    String time;

    ItemLotsModel({
        required this.success,
        required this.lotsDataDatum,
        required this.message,
        required this.time,
    });

    ItemLotsModel copyWith({
        bool? success,
        List<LotsDataDatum>? lotsDataDatum,
        String? message,
        String? time,
    }) => 
        ItemLotsModel(
            success: success ?? this.success,
            lotsDataDatum: lotsDataDatum ?? this.lotsDataDatum,
            message: message ?? this.message,
            time: time ?? this.time,
        );

    factory ItemLotsModel.fromJson(Map<String, dynamic> json) => _$ItemLotsModelFromJson(json);

    Map<String, dynamic> toJson() => _$ItemLotsModelToJson(this);
}

@JsonSerializable()
class LotsDataDatum {
    @JsonKey(name: "item_lot_id")
    int itemLotId;
    @JsonKey(name: "lot_name")
    String lotName;
    @JsonKey(name: "item_id")
    int itemId;
    @JsonKey(name: "item_in_purchase_id")
    int itemInPurchaseId;
    @JsonKey(name: "unit")
    String unit;
    @JsonKey(name: "date")
    DateTime date;
    @JsonKey(name: "purchase_price")
    int purchasePrice;
    @JsonKey(name: "mrp")
    int mrp;
    @JsonKey(name: "initial_quantity")
    int initialQuantity;
    @JsonKey(name: "consumed_quantity")
    int consumedQuantity;
    @JsonKey(name: "status")
    String status;
    @JsonKey(name: "created_at")
    DateTime createdAt;
    @JsonKey(name: "updated_at")
    DateTime updatedAt;

    LotsDataDatum({
        required this.itemLotId,
        required this.lotName,
        required this.itemId,
        required this.itemInPurchaseId,
        required this.unit,
        required this.date,
        required this.purchasePrice,
        required this.mrp,
        required this.initialQuantity,
        required this.consumedQuantity,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    LotsDataDatum copyWith({
        int? itemLotId,
        String? lotName,
        int? itemId,
        int? itemInPurchaseId,
        String? unit,
        DateTime? date,
        int? purchasePrice,
        int? mrp,
        int? initialQuantity,
        int? consumedQuantity,
        String? status,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        LotsDataDatum(
            itemLotId: itemLotId ?? this.itemLotId,
            lotName: lotName ?? this.lotName,
            itemId: itemId ?? this.itemId,
            itemInPurchaseId: itemInPurchaseId ?? this.itemInPurchaseId,
            unit: unit ?? this.unit,
            date: date ?? this.date,
            purchasePrice: purchasePrice ?? this.purchasePrice,
            mrp: mrp ?? this.mrp,
            initialQuantity: initialQuantity ?? this.initialQuantity,
            consumedQuantity: consumedQuantity ?? this.consumedQuantity,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory LotsDataDatum.fromJson(Map<String, dynamic> json) => _$LotsDataDatumFromJson(json);

    Map<String, dynamic> toJson() => _$LotsDataDatumToJson(this);
}
