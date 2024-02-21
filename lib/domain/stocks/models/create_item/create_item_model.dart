import 'package:json_annotation/json_annotation.dart';

part 'create_item_model.g.dart';

@JsonSerializable()
class StockCreateItemModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final CreateItemData? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  StockCreateItemModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  StockCreateItemModel copyWith({
    bool? success,
    CreateItemData? data,
    String? message,
    String? time,
  }) =>
      StockCreateItemModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory StockCreateItemModel.fromJson(Map<String, dynamic> json) =>
      _$StockCreateItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$StockCreateItemModelToJson(this);
}

@JsonSerializable()
class CreateItemData {
  @JsonKey(name: "created_at")
  final AtedAt? createdAt;
  @JsonKey(name: "updated_at")
  final AtedAt? updatedAt;
  @JsonKey(name: "item_in_shop_id")
  final int? itemInShopId;
  @JsonKey(name: "item_id")
  final int? itemId;
  @JsonKey(name: "shop_id")
  final int? shopId;
  @JsonKey(name: "available_stock")
  final int? availableStock;
  @JsonKey(name: "low_alert_units")
  final int? lowAlertUnits;
  @JsonKey(name: "low_alert_status")
  final bool? lowAlertStatus;
  @JsonKey(name: "status")
  final String? status;

  CreateItemData({
    this.createdAt,
    this.updatedAt,
    this.itemInShopId,
    this.itemId,
    this.shopId,
    this.availableStock,
    this.lowAlertUnits,
    this.lowAlertStatus,
    this.status,
  });

  CreateItemData copyWith({
    AtedAt? createdAt,
    AtedAt? updatedAt,
    int? itemInShopId,
    int? itemId,
    int? shopId,
    int? availableStock,
    int? lowAlertUnits,
    bool? lowAlertStatus,
    String? status,
  }) =>
      CreateItemData(
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        itemInShopId: itemInShopId ?? this.itemInShopId,
        itemId: itemId ?? this.itemId,
        shopId: shopId ?? this.shopId,
        availableStock: availableStock ?? this.availableStock,
        lowAlertUnits: lowAlertUnits ?? this.lowAlertUnits,
        lowAlertStatus: lowAlertStatus ?? this.lowAlertStatus,
        status: status ?? this.status,
      );

  factory CreateItemData.fromJson(Map<String, dynamic> json) =>
      _$CreateItemDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreateItemDataToJson(this);
}

@JsonSerializable()
class AtedAt {
  @JsonKey(name: "val")
  final String? val;

  AtedAt({
    this.val,
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
