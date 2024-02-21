import 'package:json_annotation/json_annotation.dart';

part 'transfer_info_model.g.dart';

@JsonSerializable()
class TransferInfoModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final TransferInfoData? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  TransferInfoModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  TransferInfoModel copyWith({
    bool? success,
    TransferInfoData? data,
    String? message,
    String? time,
  }) =>
      TransferInfoModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory TransferInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TransferInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransferInfoModelToJson(this);
}

@JsonSerializable()
class TransferInfoData {
  @JsonKey(name: "available_item")
  final int? availableItem;
  @JsonKey(name: "item_in_shop")
  final List<ItemInShop>? itemInShop;

  TransferInfoData({
    this.availableItem,
    this.itemInShop,
  });

  TransferInfoData copyWith({
    int? availableItem,
    List<ItemInShop>? itemInShop,
  }) =>
      TransferInfoData(
        availableItem: availableItem ?? this.availableItem,
        itemInShop: itemInShop ?? this.itemInShop,
      );

  factory TransferInfoData.fromJson(Map<String, dynamic> json) =>
      _$TransferInfoDataFromJson(json);

  Map<String, dynamic> toJson() => _$TransferInfoDataToJson(this);
}

@JsonSerializable()
class ItemInShop {
  @JsonKey(name: "shop_id")
  final int? shopId;
  @JsonKey(name: "available_item")
  final int? availableItem;

  ItemInShop({
    this.shopId,
    this.availableItem,
  });

  ItemInShop copyWith({
    int? shopId,
    int? availableItem,
  }) =>
      ItemInShop(
        shopId: shopId ?? this.shopId,
        availableItem: availableItem ?? this.availableItem,
      );

  factory ItemInShop.fromJson(Map<String, dynamic> json) =>
      _$ItemInShopFromJson(json);

  Map<String, dynamic> toJson() => _$ItemInShopToJson(this);
}
