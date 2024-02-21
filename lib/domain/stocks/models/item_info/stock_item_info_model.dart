// To parse this JSON data, do
//
//     final myListItemInfoModel = myListItemInfoModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'stock_item_info_model.g.dart';

MyListItemInfoModel myListItemInfoModelFromJson(String str) =>
    MyListItemInfoModel.fromJson(json.decode(str));

String myListItemInfoModelToJson(MyListItemInfoModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class MyListItemInfoModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final MyListItemInfoData? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  MyListItemInfoModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  MyListItemInfoModel copyWith({
    bool? success,
    MyListItemInfoData? data,
    String? message,
    String? time,
  }) =>
      MyListItemInfoModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory MyListItemInfoModel.fromJson(Map<String, dynamic> json) =>
      _$MyListItemInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyListItemInfoModelToJson(this);
}

@JsonSerializable()
class MyListItemInfoData {
  @JsonKey(name: "item_id")
  final int? itemId;
  @JsonKey(name: "item_name")
  final String? itemName;
  @JsonKey(name: "item_code")
  final int? itemCode;
  @JsonKey(name: "category_id")
  final int? categoryId;
  @JsonKey(name: "hsn_sac_code")
  final int? hsnSacCode;
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @JsonKey(name: "shop_id")
  final int? shopId;
  @JsonKey(name: "total_quantity")
  final int? totalQuantity;
  @JsonKey(name: "low_stock_quantity")
  final int? lowStockQuantity;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "category_name")
  final String? categoryName;

  MyListItemInfoData({
    this.itemId,
    this.itemName,
    this.itemCode,
    this.categoryId,
    this.hsnSacCode,
    this.imageUrl,
    this.shopId,
    this.totalQuantity,
    this.lowStockQuantity,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.categoryName,
  });

  MyListItemInfoData copyWith({
    int? itemId,
    String? itemName,
    int? itemCode,
    int? categoryId,
    int? hsnSacCode,
    String? imageUrl,
    int? shopId,
    int? totalQuantity,
    int? lowStockQuantity,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? categoryName,
  }) =>
      MyListItemInfoData(
        itemId: itemId ?? this.itemId,
        itemName: itemName ?? this.itemName,
        itemCode: itemCode ?? this.itemCode,
        categoryId: categoryId ?? this.categoryId,
        hsnSacCode: hsnSacCode ?? this.hsnSacCode,
        imageUrl: imageUrl ?? this.imageUrl,
        shopId: shopId ?? this.shopId,
        totalQuantity: totalQuantity ?? this.totalQuantity,
        lowStockQuantity: lowStockQuantity ?? this.lowStockQuantity,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        categoryName: categoryName ?? this.categoryName,
      );

  factory MyListItemInfoData.fromJson(Map<String, dynamic> json) =>
      _$MyListItemInfoDataFromJson(json);

  Map<String, dynamic> toJson() => _$MyListItemInfoDataToJson(this);
}
