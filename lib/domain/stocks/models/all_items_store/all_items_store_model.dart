import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_items_store_model.g.dart';

@JsonSerializable()
class AllItemsOfStore {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "data")
  List<AllItemsData>? data;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "time")
  String? time;

  AllItemsOfStore({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  factory AllItemsOfStore.fromJson(Map<String, dynamic> json) => _$AllItemsOfStoreFromJson(json);

  Map<String, dynamic> toJson() => _$AllItemsOfStoreToJson(this);
}

@JsonSerializable()
class AllItemsData {
  @JsonKey(name: "item_id")
  int? itemId;
  @JsonKey(name: "item_name")
  String? itemName;
  @JsonKey(name: "item_code")
  int? itemCode;
  @JsonKey(name: "category_id")
  int? categoryId;
  @JsonKey(name: "brand")
  String? brand;
  @JsonKey(name: "hsn_sac_code")
  int? hsnSacCode;
  @JsonKey(name: "shop_id")
  int? shopId;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "units")
  List<String>? units;
  @JsonKey(name: "category_name")
  CategoryName? categoryName;

  AllItemsData({
    this.itemId,
    this.itemName,
    this.itemCode,
    this.categoryId,
    this.brand,
    this.hsnSacCode,
    this.shopId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.units,
    this.categoryName,
  });

  factory AllItemsData.fromJson(Map<String, dynamic> json) => _$AllItemsDataFromJson(json);

  Map<String, dynamic> toJson() => _$AllItemsDataToJson(this);
}

enum CategoryName {
  @JsonValue("Electronics")
  ELECTRONICS,
  @JsonValue("Grocery")
  GROCERY,
  @JsonValue("Stationery")
  STATIONERY
}
