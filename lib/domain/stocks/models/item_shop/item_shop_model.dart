// To parse this JSON itemShopData, do
//
//     final itemShopModel = itemShopModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'item_shop_model.g.dart';

ItemShopModel itemShopModelFromJson(String str) => ItemShopModel.fromJson(json.decode(str));

String itemShopModelToJson(ItemShopModel itemShopData) => json.encode(itemShopData.toJson());

@JsonSerializable()
class ItemShopModel {
    @JsonKey(name: "success")
    bool success;
    @JsonKey(name: "data")
    ItemShopData itemShopData;
    @JsonKey(name: "message")
    String message;
    @JsonKey(name: "time")
    String time;

    ItemShopModel({
        required this.success,
        required this.itemShopData,
        required this.message,
        required this.time,
    });

    ItemShopModel copyWith({
        bool? success,
        ItemShopData? itemShopData,
        String? message,
        String? time,
    }) => 
        ItemShopModel(
            success: success ?? this.success,
            itemShopData: itemShopData ?? this.itemShopData,
            message: message ?? this.message,
            time: time ?? this.time,
        );

    factory ItemShopModel.fromJson(Map<String, dynamic> json) => _$ItemShopModelFromJson(json);

    Map<String, dynamic> toJson() => _$ItemShopModelToJson(this);
}

@JsonSerializable()
class ItemShopData {
    @JsonKey(name: "item_id")
    int itemId;
    @JsonKey(name: "item_name")
    String itemName;
    @JsonKey(name: "item_code")
    int itemCode;
    @JsonKey(name: "category_id")
    int categoryId;
    @JsonKey(name: "hsn_sac_code")
    int hsnSacCode;
    @JsonKey(name: "image_url")
    String imageUrl;
    @JsonKey(name: "shop_id")
    int shopId;
    @JsonKey(name: "low_stock_quantity")
    int lowStockQuantity;
    @JsonKey(name: "status")
    String status;
    @JsonKey(name: "created_at")
    DateTime createdAt;
    @JsonKey(name: "updated_at")
    DateTime updatedAt;
    @JsonKey(name: "category_name")
    String categoryName;

    ItemShopData({
        required this.itemId,
        required this.itemName,
        required this.itemCode,
        required this.categoryId,
        required this.hsnSacCode,
        required this.imageUrl,
        required this.shopId,
        required this.lowStockQuantity,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.categoryName,
    });

    ItemShopData copyWith({
        int? itemId,
        String? itemName,
        int? itemCode,
        int? categoryId,
        int? hsnSacCode,
        String? imageUrl,
        int? shopId,
        int? lowStockQuantity,
        String? status,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? categoryName,
    }) => 
        ItemShopData(
            itemId: itemId ?? this.itemId,
            itemName: itemName ?? this.itemName,
            itemCode: itemCode ?? this.itemCode,
            categoryId: categoryId ?? this.categoryId,
            hsnSacCode: hsnSacCode ?? this.hsnSacCode,
            imageUrl: imageUrl ?? this.imageUrl,
            shopId: shopId ?? this.shopId,
            lowStockQuantity: lowStockQuantity ?? this.lowStockQuantity,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            categoryName: categoryName ?? this.categoryName,
        );

    factory ItemShopData.fromJson(Map<String, dynamic> json) => _$ItemShopDataFromJson(json);

    Map<String, dynamic> toJson() => _$ItemShopDataToJson(this);
}
