// To parse this JSON data, do
//
//     final itemTimeLineModel = itemTimeLineModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'item_time_line_model.g.dart';

ItemTimeLineModel itemTimeLineModelFromJson(String str) =>
    ItemTimeLineModel.fromJson(json.decode(str));

String itemTimeLineModelToJson(ItemTimeLineModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ItemTimeLineModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final List<ItemTimeLineData>? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  ItemTimeLineModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  ItemTimeLineModel copyWith({
    bool? success,
    List<ItemTimeLineData>? data,
    String? message,
    String? time,
  }) =>
      ItemTimeLineModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory ItemTimeLineModel.fromJson(Map<String, dynamic> json) =>
      _$ItemTimeLineModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemTimeLineModelToJson(this);
}

@JsonSerializable()
class ItemTimeLineData {
  @JsonKey(name: "date")
  final String? date;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "unit")
  final String? unit;
  @JsonKey(name: "shop_data")
  final ItemTimeLineShopData? shopData;
  @JsonKey(name: "invoice_id")
  final int? invoiceId;
  @JsonKey(name: "difference_in_quantity")
  final int? differenceInQuantity;

  ItemTimeLineData({
    this.date,
    this.type,
    this.quantity,
    this.unit,
    this.invoiceId,
    this.differenceInQuantity,
    this.shopData,
  });

  ItemTimeLineData copyWith({
    String? date,
    String? type,
    int? quantity,
    String? unit,
    int? invoiceId,
    int? differenceInQuantity,
    ItemTimeLineShopData? shopData,
  }) =>
      ItemTimeLineData(
        date: date ?? this.date,
        type: type ?? this.type,
        quantity: quantity ?? this.quantity,
        unit: unit ?? this.unit,
        invoiceId: invoiceId ?? this.invoiceId,
        differenceInQuantity: differenceInQuantity ?? this.differenceInQuantity,
        shopData: shopData ?? this.shopData,
      );

  factory ItemTimeLineData.fromJson(Map<String, dynamic> json) =>
      _$ItemTimeLineDataFromJson(json);

  Map<String, dynamic> toJson() => _$ItemTimeLineDataToJson(this);
}

@JsonSerializable()
class ItemTimeLineShopData {
  @JsonKey(name: "shop_id")
  final int? shopId;
  @JsonKey(name: "shop_name")
  final String? shopName;
  @JsonKey(name: "shop_colour")
  final String? shopColour;

  ItemTimeLineShopData({
    this.shopId,
    this.shopName,
    this.shopColour,
  });

  ItemTimeLineShopData copyWith({
    int? shopId,
    String? shopName,
    String? shopColour,
  }) =>
      ItemTimeLineShopData(
        shopId: shopId ?? this.shopId,
        shopName: shopName ?? this.shopName,
        shopColour: shopColour ?? this.shopColour,
      );

  factory ItemTimeLineShopData.fromJson(Map<String, dynamic> json) =>
      _$ItemTimeLineShopDataFromJson(json);

  Map<String, dynamic> toJson() => _$ItemTimeLineShopDataToJson(this);
}
